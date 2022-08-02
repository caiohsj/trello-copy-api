# language: pt

Funcionalidade: O usuário poderá criar quadros, atualizar, deletar e ver quadros que ele já criou

  Cenario de Fundo:
    Dado um test client
    Dado um usuário logado no sistema

  Cenário: Usuário cria um quadro com sucesso
    Dado os dados necessários para criar um quadro
    Quando o usuário enviar os dados para criar um quadro
    Então o usuário deve ter criado um quadro com sucesso

  Cenário: Usuário atualiza um quadro que ele criou
    Dado um quadro cadastrado pelo usuário no sistema
    E os novos dados do board
    Quando o usuário enviar os dados para atualizar o quadro
    Então o usuário deve ter atualizado o quadro com sucesso

  Cenário: Usuário tenta atualizar um quadro que foi criado por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    E os novos dados do board
    Quando o usuário enviar os dados para atualizar o quadro
    Então a resposta deve conter o status 404

  Cenário: Usuário deleta um quadro que ele criou
    Dado um quadro cadastrado pelo usuário no sistema
    Quando o usuário clicar para deletar o quadro
    Então o usuário deve ter deletado o quadro com sucesso

  Cenário: Usuário tenta deletar um quadro que foi criado por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    Quando o usuário clicar para deletar o quadro
    Então a resposta deve conter o status 404
  
  Cenário: Usuário visualiza os quadros que ele criou
    Dado 3 quadros cadastrados pelo usuário no sistema
    Quando o usuário clicar para visualizar os quadros
    Então o usuário deve visualizar 3 quadros