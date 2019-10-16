class LoginPage
    include Capybara::DSL

    def faz_login(email, senha)
        find('input[placeholder=Email]').set email
        find('input[type=password]').set senha
        click_button 'Entrar'
    end

    def msg_alerta
        within('form[id=login]') do
            return find('.alert').text
        end
    end

    # def verifica_autenticacao(mensagem)
    #     within('form[id=login]') do
    #         expect(find('.alert').text).to eql mensagem                      #busca o alerta dentro do form com id=login e valida se o texto do alerta é o mesmo da variável "mensagem" garantindo além do texto, o local do texto.
    #     end 
    # end
end