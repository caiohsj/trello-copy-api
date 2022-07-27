# language: pt

Funcionalidade: O usuário poderá fazer o seu cadastro no sistema

  Cenario de Fundo:
    Dado um test client

  Cenário: usuário realiza o cadastro com sucesso
    Dado os dados para efetuar o cadastro
    Quando o usuário clicar em cadastrar
    Então o usuario deve ter sido registrado com sucesso

  Cenário: usuário tenta realizar o cadastro com um email já cadastrado
    Dado um usuário cadastrado no sistema
    E os dados de um usuário já cadastrado
    Quando o usuário clicar em cadastrar
    Então o usuario não deve ter sido registrado com sucesso