# Cenário: Usuário cria um card com sucesso

Dado('os dados necessários para criar uma coluna') do
  @column_params = {
    title: 'Coluna de teste',
    board_id: @board.id
  }
end

Quando('o usuário enviar os dados para criar uma coluna') do
  @response = @test_client.post('/api/v1/columns', @column_params)
end

Então('o usuário deve ter criado uma coluna com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title]).to be_present
end

# Cenário: Usuário atualiza uma coluna que ele criou

Dado('uma coluna cadastrada pelo usuário no sistema') do
  @column = FactoryBot.create(:column, board: @board)
end

Dado('os novos dados da coluna') do
  @column_params = {
    title: 'Nova coluna de teste'
  }
end

Quando('o usuário enviar os dados para atualizar a coluna') do
  @response = @test_client.put("/api/v1/columns/#{@column.id}", @column_params)
end

Então('o usuário deve ter atualizado a coluna com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title] != @column.title).to be_truthy
end

# Cenário: Usuário tenta atualizar uma coluna que foi criado por outro usuário

Dado('uma coluna cadastrada por outro usuário no sistema') do
  @column = FactoryBot.create(:column, board: @board)
end

# Cenário: Usuário deleta uma coluna que ele criou

Quando('o usuário clicar para deletar a coluna') do
  @response = @test_client.delete("/api/v1/columns/#{@column.id}")
end

Então('o usuário deve ter deletado a coluna com sucesso') do
  expect(Column.all.count).to be_equal(0)
end

# Cenário: Usuário visualiza uma coluna específica que ele criou

Quando('o usuário clicar para visualizar a coluna') do
  @response = @test_client.get("/api/v1/columns/#{@column.id}")
end

Então('a resposta deve conter os dados da coluna específica') do
  expect(@response[:body][:id]).to be_present
  expect(@response[:body][:title]).to be_present
end
