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
  @response = @test_client.put("/api/v1/boards/34", @update_params)
end

Então('o usuário deve ter atualizado o quadro com sucesso') do
  byebug
end

# Cenário: Usuário deleta um quadro que ele criou
Dado('{int} quadros cadastrados pelo usuário no sistema') do |int|
  
end

Quando('o usuário clicar para deletar o quadro') do

end

Então('o usuário deve ter deletado o quadro com sucesso') do

end

# Cenário: Usuário visualiza os quadros que ele criou

Quando('o usuário clicar para visualizar os quadros') do

end

Então('o usuário deve visualizar {int} quadros') do |int|

end
