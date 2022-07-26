Dado('um usuário cadastro no sistema') do
  @user = FactoryBot.create(:user)
end

Dado('a senha do usuário') do
  @password = 'mypass'
end

Quando('o usuário clicar em entrar') do
  @login_response = @test_client.post('/users/sign_in', { email: @user.email, password: @password})
end

Então('o usuario deve ter sido autenticado com sucesso') do
  body = JSON.parse(@login_response.body)
  expect(@login_response.status).to be_equal(200)
  expect(body['email'] == @user.email).to be_truthy
  expect(body['authentication_token'].present?).to be_truthy
end

