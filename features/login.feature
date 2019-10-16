#language: pt

Funcionalidade: Login
    Para que eu possa anunciar meus veículos
    Sendo um usuário cadastrado
    Posso acessar o sistema com meu email e senha

    Contexto: Formulario Login
        Dado que eu acessei a página de login

    @smoke @logout
    Cenário: Login do Usuário

        Quando faço login com
            | nome  | Contoso                   |    
            | email | contoso@ninjahouse.com.br |
            | senha | 123456                    |
        Então sou autenticado com sucesso

    @tentativa_login
    Esquema do Cenario: Tentar logar

        Quando faço login com 
            | email | <email>       |
            | senha | <senha>       |
        Então devo ver a seguinte mensagem "<alerta>"

    Exemplos:
    | email             | senha  | alerta                        |
    | eu@papito.io      | abc789 | Usuário e/ou senha inválidos. |
    | jamilla@gmail.com | 123456 | Usuário e/ou senha inválidos. |
    | eu@papito_eu.io   | 123456 | Email inválido.               |
    | eu@papito.io      |        | Senha não informada.          |
    |                   | 123456 | Email não informado.          |
