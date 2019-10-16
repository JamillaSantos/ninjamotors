class AnuncioPage
    include Capybara::DSL

    def novo_anuncio(veiculo, blindado)
        seleciona_marca(veiculo[:marca])
        escolhe_modelo(veiculo[:modelo])
        find('#version').set veiculo[:versao]
        find('#year').set veiculo[:ano]
        find('#price').set veiculo[:preco]
        marca_blindado if blindado == true
        find('#sell-my-car').click
    end

    def alerta
        find('.alert')
    end
    
    # private                                                                         #só acessa esses métodos dentro da classe
    
    def marca_blindado
        find('#armoredCar').click
    end


    def seleciona_marca(marca)
        find('#brand').find('option', text: marca).select_option
    end

    def escolhe_modelo(modelo)
        find("input[type=radio][value=#{modelo}]").click                            #aspas duplas no ruby é utilizada para fazer interpolação de string        
    end
end