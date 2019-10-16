Dado("que eu acessei a página de login") do
  @home.acessar
  @nav.vai_para_login                           
end
  
# Quando("faço login com {string} e {string}") do |email, senha|
#     #find('input[name=email]]').set email
#     find('input[placeholder=Email]').set email
#     #find('input[placeholder=Senha]').set senha
#     find('input[type=password]').set senha
#     click_button 'Entrar'                                          #para elemento html tipo "button" usar CLick_button
#   end

Quando("faço login com") do |table|
    @usuario = table.rows_hash  
    @login.faz_login(@usuario[:email], @usuario[:senha])
end
  
Então("devo ver a seguinte mensagem {string}") do |mensagem|
  # @login.verifica_autenticacao(mensagem)
  expect(@login.msg_alerta).to eql mensagem
end