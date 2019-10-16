#require 'faker' #biblioteca para utilizar email dinâmico

Dado("que estou na página de cadastro") do
    @home.acessar
    @nav.vai_para_cadastro
end
  
Quando("faço o meu cadastro com") do |table|
    @usuario = table.rows_hash

    #Data Access Object
    DAO.new.remover_usuario(@usuario[:email])

    @cadastro.faz_cadastro(@usuario)
end
    
Então("devo ver a mensagem {string}") do |mensagem|
    expect(@cadastro.alerta).to have_content mensagem              #espera que o alerta contenha o valor da variável "mensagem"
end