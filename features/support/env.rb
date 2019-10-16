require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

@browser = ENV['BROWSER']                                           #variável criada para chamar o browser em headless 'cucumber.yaml'

#Se o tipo de browser for headless, o javascript_driver vai ser selenium
if @browser.eql?('headless')
    Capybara.javascript_driver = :selenium
    Capybara.run_server = false                                     #desliga o servidor do Capybara
end

#Cria um servidor remoto    
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(        #Não checa o navegador padrão
        'chromeOptions' => {
            'args' => ['--no-default-browser-check']
        }
    )

    Capybara.register_driver :selenium do |app|                     #Esta estrutura permite que o Jenkins execute os testes em um container e não na máquina
        Capybara::Selenium::Driver.new(
            app,
            browser: :remote,
            url: 'http://selenium_driver:4444/wd/hub',
            desired_capabilities: caps 
        )
end

Capybara.configure do |c|

    if @browser.eql?('headless')
        c.default_driver = :selenium
    elsif @browser.eql?('chrome')
        c.default_driver = :selenium_chrome
    end

    c.app_host = 'http://ninjamotors.herokuapp.com'                 #define url da aplicação em um único lugar
    c.default_max_wait_time = 10                                    #define espera de elemento implicitamente
end

