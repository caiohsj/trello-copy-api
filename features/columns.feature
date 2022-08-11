# language: pt

Funcionalidade: O usuário poderá criar colunas dentro dos quadros, atualizar, deletar e ver essas colunas que ele já criou

  Cenario de Fundo:
    Dado um test client
    Dado um usuário logado no sistema

  Cenário: Usuário cria uma coluna com sucesso
    Dado um quadro cadastrado pelo usuário no sistema
    E os dados necessários para criar uma coluna
    Quando o usuário enviar os dados para criar uma coluna
    Então o usuário deve ter criado uma coluna com sucesso

  Cenário: Usuário atualiza uma coluna que ele criou
    Dado um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    E os novos dados da coluna
    Quando o usuário enviar os dados para atualizar a coluna
    Então o usuário deve ter atualizado a coluna com sucesso

  Cenário: Usuário tenta atualizar uma coluna que foi criado por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    E uma coluna cadastrada por outro usuário no sistema
    E os novos dados do board
    Quando o usuário enviar os dados para atualizar a coluna
    Então a resposta deve conter o status 404

  Cenário: Usuário deleta uma coluna que ele criou
    Dado um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    Quando o usuário clicar para deletar a coluna
    Então o usuário deve ter deletado a coluna com sucesso

  Cenário: Usuário tenta deletar uma coluna que foi criada por outro usuário
    Dado um outro usuário cadastrado no sistema
    E um quadro cadastrado por outro usuário no sistema
    E uma coluna cadastrada por outro usuário no sistema
    Quando o usuário clicar para deletar a coluna
    Então a resposta deve conter o status 404

  Cenário: Usuário visualiza uma coluna específica que ele criou
    Dado um quadro cadastrado pelo usuário no sistema
    E uma coluna cadastrada pelo usuário no sistema
    Quando o usuário clicar para visualizar a coluna
    Então a resposta deve conter o status 200
    E a resposta deve conter os dados da coluna específica