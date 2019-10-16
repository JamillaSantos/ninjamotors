class HomePage
    include Capybara::DSL

    def acessar
        visit '/'
    end
end