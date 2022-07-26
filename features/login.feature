# language: pt

Funcionalidade: O usuário poderá fazer login no sistema

  Cenario de Fundo:
    Dado um test client

  Cenário: usuário realiza o login com sucesso
    Dado um usuário cadastro no sistema
    E a senha do usuário
    Quando o usuário clicar em entrar
    Então o usuario deve ter sido autenticado com sucesso