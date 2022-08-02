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
  @response = @test_client.post('/users', @user_params)
end

Então('o usuario deve ter sido registrado com sucesso') do
  expect(@response[:status]).to be_equal(200)
  expect(@response[:body][:id].present?).to be_truthy
end

# Cenário: usuário tenta realizar o cadastro com um email já cadastrado

Dado('os dados de um usuário já cadastrado') do
  @user_params = {
    name: 'Caio 2',
    email: 'john@gmail.com',
    password: 'minhasenha',
  }
end

Então('o usuario não deve ter sido registrado com sucesso') do
  expect(@response[:status]).to be_equal(422)
  expect(User.where(email: @user_params[:email]).count).to be_equal(1)
end
