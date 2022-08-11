# language: pt

Funcionalidade: O usuário poderá criar cards dentro das colunas, atualizar, deletar e ver essas cards que ele já criou

  Cenario de Fundo:
    Dado um test client
    E um usuário logado no sistema

  Cenário: Usuário cria um card com sucesso
    E um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    E os dados necessários para criar um card
    Quando o usuário enviar os dados para criar um card
    Então o usuário deve ter criado um card com sucesso

  Cenário: Usuário atualiza um card que ele criou
    E um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    E um card cadastrado pelo usuário no sistema
    E os novos dados do card
    Quando o usuário enviar os dados para atualizar o card
    Então o usuário deve ter atualizado o card com sucesso

  Cenário: Usuário tenta atualizar um card que foi criado por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    E uma coluna cadastrada por outro usuário no sistema
    E um card cadastrado por outro usuário no sistema
    E os novos dados do card
    Quando o usuário enviar os dados para atualizar o card
    Então a resposta deve conter o status 404

  Cenário: Usuário deleta um card que ele criou
    E um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    E um card cadastrado pelo usuário no sistema
    Quando o usuário clicar para deletar o card
    Então o usuário deve ter deletado o card com sucesso

  Cenário: Usuário tenta deletar um card que foi criado por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    E uma coluna cadastrada por outro usuário no sistema
    E um card cadastrado por outro usuário no sistema
    Quando o usuário clicar para deletar o card
    Então a resposta deve conter o status 404

  Cenário: Usuário visualiza um card específico que ele criou
    E um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    E um card cadastrado pelo usuário no sistema
    Quando o usuário clicar para visualizar o card
    Então a resposta deve conter o status 200
    E a resposta deve conter os dados do card específico