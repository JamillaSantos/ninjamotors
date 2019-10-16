#language: pt

Funcionalidade: Cadastro do usuário
    Sendo um visitante do site
    Posso fazer meu cadastro com nome, email e senha
    Para que eu possa anunciar meu veiculo usado

@sprint1 @smoke @logout
Cenário: Cadastro simples

    Dado que estou na página de cadastro
    Quando faço o meu cadastro com
        | nome  | Fernando           |
        | email | eu@papito.io       |
        | senha | 123456             |
    Então sou autenticado com sucesso

@sprint1
Esquema do Cenário: Tentativa de cadastro

    Dado que estou na página de cadastro
    Quando faço o meu cadastro com
        | nome  | <nome>  |
        | email | <email> |
        | senha | <senha> |
    Então devo ver a mensagem "<alerta>"

    Exemplos: 
        | nome     | email              | senha  | alerta                                  |
        | Fernando | eu@papito_eu.io.br | 123456 | Email inválido.                         |
        | Fernando | eu@papito.io       |        | Senha não informada.                    |
        |          | eu@papito.io       | 123456 | Nome não informado.                     |
        | Fernando | eu@papito.io       | 12345  | Senha deve ter pelo menos 6 caracteres. |
