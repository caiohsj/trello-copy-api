Dado('um usuário cadastrado no sistema') do
  @user = FactoryBot.create(:user)
end

Dado('as credenciais do usuário') do
  @credentials = {
    email: @user.email,
    password: 'mypass'
  }
end

Quando('o usuário clicar em entrar') do
  @login_response = @test_client.post('/api/v1/users/sign_in', @credentials)
end

Então('o usuario deve ter sido autenticado com sucesso') do
  body = @login_response[:body]
  expect(@login_response[:status]).to be_equal(200)
  expect(body[:email] == @user.email).to be_truthy
  expect(body[:authentication_token].present?).to be_truthy
end

# Cenário: usuário tenta realizar o login com credenciais inválidas

Dado('a credenciais inválidas do usuário') do
  @credentials = {
    email: 'test@gmail.com',
    password: 'mypass123'
  }
end

Então('o usuario não deve ter sido autenticado com sucesso') do
  expect(@login_response[:status]).to be_equal(422)
  expect(@login_response[:body]).to be_include(I18n.t('services.session.invalid_credentials'))
end

# Background

Dado('um usuário logado no sistema') do
  @password = 'mypass'
  @user = FactoryBot.create(:user, password: @password)
  @test_client.login(@user, @password)
end
