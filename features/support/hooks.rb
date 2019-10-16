# Método "hoockado" que será executado após execução de todos os steps do cenário que possuir a tag "@logout"
#"Triggers" dos cenários

Before do               #instanciando todas as classes necessárias
    @home = HomePage.new
    @nav = Nav.new
    @login = LoginPage.new
    @cadastro = CadastroPage.new
    @anuncio_page = AnuncioPage.new
    @swal = SweetAlert.new

    #page.current_window.resize_to(1440, 900)                        #passar a resolução mínima da aplicação
end

Before('@login') do
    @home.acessar
    @nav.vai_para_login
    @login.faz_login('contoso@ninjahouse.com.br', '123456')
end

def tira_print(scenario)                                            #Salva prints para cada cenário executado            
    nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')                  #expressão regular para retirar caracteres especiais da string
    nome = nome.tr(' ', '_').downcase!                              #substitui espaços por _ e coloca tudo em caixa baixa
    screenshot = "log/screenshots/#{nome}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Screenshot')                    #gera link do screenshot no html
end

After do |scenario|                                                 
    tira_print(scenario)
    
    tem = page.has_css?('#userMenu')

    if tem
        visit '/sair'
        # @nav.sair
        wait_until_css('.swal2-modal')
    end
end

# After('@logout') do
#     @nav.sair
#     wait_until_css('.swal2-modal')
# end

def wait_until_css(element, time_out = Capybara.default_max_wait_time)
    found = true

    while found ==true
        sleep 1
        raise Timeout::Error, 'Time out of wait until css' + element if time_out.zero?
        found = page.has_css?(element)
        time_out -= 1
    end 
end