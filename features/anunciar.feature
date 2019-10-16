#language: pt

Funcionalidade: Anunciar meu carro
    Para que eu possa receber ofertas de compras
    Sendo um usuário cadastrado
    Posso anunciar meu veículo

    Contexto: Formulário de anúncio
        Dado que acessei o formulário de anúncio de veículos 

    @smoke @login
    Cenário: Criar anúncio

        E que possuo o seguinte veículo:
            | marca     | modelo  | versao    | ano   | preco      |
            | Chevrolet | Camaro  | Blue 79   | 1979  | 250.000,00 |
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Parabéns. Seu carro foi anunciado com sucesso.
            """

    @login
    Cenário: Carro blindado

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion | 2.4 automático | 2016 | 70.000,00 |
        E este veículo é blindado
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Não anunciamos carro blindado.
            """

    @login
    Cenário: Anúncio duplicado

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion | 2.4 automático | 2016 | 70.000,00 |
        Mas eu já cadastrei este anúncio anteriormente
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Este anúncio já foi cadastrado.
            """

    @login 
    Cenário: Anúncio sem marca

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            |       | Fusion | 2.4 automático | 2016 | 70.000,00 |
        Quando faço o anúncio deste veículo sem marca
        Então devo ver a seguinte mensagem de alerta:
            """
            Selecione a marca do seu carro.
            """        

    @login 
    Cenário: Anúncio sem modelo

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  |        | 2.4 automático | 2016 | 70.000,00 |
        Quando faço o anúncio deste veículo sem modelo
        Então devo ver a seguinte mensagem de alerta:
            """
            Selecione o modelo do seu carro.
            """        

    @login 
    Cenário: Anúncio sem versão

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion |                | 2016 | 70.000,00 |
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem de alerta:
            """
            Selecione a versão do seu carro.
            """        

    @login 
    Cenário: Anúncio sem ano

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion | 2.4 automático |      | 70.000,00 |
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem de alerta:
            """
            Selecione o ano do seu carro.
            """        

    @login @temp
    Cenário: Anúncio sem preço

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion | 2.4 automático | 2016 |           |
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem de alerta:
            """
            Informe o preço do seu carro.
            """        
