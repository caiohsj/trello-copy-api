# Cenário: Usuário cria um card com sucesso

Dado('os dados necessários para criar um card') do
  @card_params = {
    title: 'Titulo do card',
    description: 'Descrição do card',
    column_id: @column.id
  }
end

Quando('o usuário enviar os dados para criar um card') do
  @response = @test_client.post('/api/v1/cards', @card_params)
end

Então('o usuário deve ter criado um card com sucesso') do
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title] == @card_params[:title]).to be_truthy
  expect(@response[:body][:description] == @card_params[:description]).to be_truthy
end

# Cenário: Usuário atualiza um card que ele criou

Dado('um card cadastrado pelo usuário no sistema') do
  @card = FactoryBot.create(:card, column: @column)
end

Dado('os novos dados do card') do
  @card_params = {
    title: 'Titulo do card atualizado',
    description: 'Descrição do card atualizado'
  }
end

Quando('o usuário enviar os dados para atualizar o card') do
  @response = @test_client.put("/api/v1/cards/#{@card.id}", @card_params)
end

Então('o usuário deve ter atualizado o card com sucesso') do
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title] != @card.title).to be_truthy
  expect(@response[:body][:description] != @card.description).to be_truthy
end

# Cenário: Usuário tenta atualizar um card que foi criado por outro usuário

Dado('um card cadastrado por outro usuário no sistema') do
  @card = FactoryBot.create(:card, column: @column)
end

# Cenário: Usuário deleta um card que ele criou

Quando('o usuário clicar para deletar o card') do
  @response = @test_client.delete("/api/v1/cards/#{@card.id}")
end

Então('o usuário deve ter deletado o card com sucesso') do
  expect(@user.cards.count).to be_equal(0)
end

# Cenário: Usuário visualiza um card específico que ele criou

Quando('o usuário clicar para visualizar o card') do
  @response = @test_client.get("/api/v1/cards/#{@card.id}")
end

Então('a resposta deve conter os dados do card específico') do
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title]).to be_present
  expect(@response[:body][:description]).to be_present
end
