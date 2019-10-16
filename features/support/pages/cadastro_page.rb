class CadastroPage
    include Capybara::DSL

    def faz_cadastro(usuario)
        fill_in 'fullName', with: usuario[:nome]
        fill_in 'email', with: usuario[:email]
        fill_in 'password', with: usuario[:senha]
        
        click_button 'Cadastrar' 
    end

    def alerta
        find('.alert')
    end
end