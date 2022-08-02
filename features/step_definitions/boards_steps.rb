# Cenário: Usuário cria um quadro com sucesso

Dado('um usuário logado no sistema') do
  @password = 'mypass'
  @user = FactoryBot.create(:user, password: @password)
  @test_client.login(@user, @password)
end

Dado('os dados necessários para criar um quadro') do
  @create_params = {
    name: 'Primeiro Quadro'
  }
end

Quando('o usuário enviar os dados para criar um quadro') do
  @response = @test_client.post('/api/v1/boards', @create_params)
end

Então('o usuário deve ter criado um quadro com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body][:id].present?).to be_truthy
  expect(@response[:body][:name].present?).to be_truthy
end

# Cenário: Usuário atualiza um quadro que ele criou

Dado('um quadro cadastrado pelo usuário no sistema') do
  @board = FactoryBot.create(:board, user: @user)
end

Dado('os novos dados do board') do
  @update_params = {
    background_color: '#55efc4',
    background_photo: Rack::Test::UploadedFile.new("#{Rails.root}/test/mocks/background_photo.jpg")
  }
end

Quando('o usuário enviar os dados para atualizar o quadro') do
  @response = @test_client.put("/api/v1/boards/#{@board.id}", @update_params)
end

Então('o usuário deve ter atualizado o quadro com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body][:background_color] != @board.background_color).to be_truthy
  expect(@response[:body][:background_photo] != @board.background_photo).to be_truthy
end

# Cenário: Usuário deleta um quadro que ele criou

Quando('o usuário clicar para deletar o quadro') do
  @response = @test_client.delete("/api/v1/boards/#{@board.id}")
end

Então('o usuário deve ter deletado o quadro com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(Board.all).to be_empty
end

# Cenário: Usuário visualiza os quadros que ele criou

Dado('{int} quadros cadastrados pelo usuário no sistema') do |int|
  int.times do
    FactoryBot.create(:board, user: @user)
  end
end

Quando('o usuário clicar para visualizar os quadros') do
  @response = @test_client.get('/api/v1/boards')
end

Então('o usuário deve visualizar {int} quadros') do |int|
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body].count).to be_equal(int)
end

# Cenário: Usuário tenta atualizar um quadro que foi criado por outro usuário

Dado('um outro usuário cadastrado no sistema') do
  @other_user = FactoryBot.create(:user, name: 'Outro usuário', email: 'billgates@outlook.com')
end

Dado('um quadro cadastrado por outro usuário no sistema') do
  @board = FactoryBot.create(:board, user: @other_user)
end

Então('a resposta deve conter o status {int}') do |int|
  expect(@response[:status]).to be_equal(int)
end
