# language: pt

Funcionalidade: O usuário poderá fazer login no sistema

  Cenario de Fundo:
    Dado um test client

  Cenário: usuário realiza o login com sucesso
    Dado um usuário cadastrado no sistema
    E as credenciais do usuário
    Quando o usuário clicar em entrar
    Então o usuario deve ter sido autenticado com sucesso

  Cenário: usuário tenta realizar o login com credenciais inválidas
    Dado um usuário cadastrado no sistema
    E a credenciais inválidas do usuário
    Quando o usuário clicar em entrar
    Então o usuario não deve ter sido autenticado com sucesso