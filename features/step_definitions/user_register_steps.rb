# Cenário de Fundo

Dado('um test client') do
  @test_client = TestClient.new
end

# Cenário: usuário realiza o cadastro com sucesso

Dado('os dados para efetuar o cadastro') do
  @user_params = {
    name: 'Caio',
    email: 'caio@gmail.com',
    password: 'minhasenha',
  }
end

Quando('o usuário clicar em cadastrar') do
  @user_register_response = @test_client.post('/users', @user_params)
end

Então('o usuario deve ter sido registrado com sucesso') do
  expect(User.all.count).to be_equal(1)
end