Dado("que acessei o formulário de anúncio de veículos") do
    @nav.vai_para_anuncio
end

Dado("que possuo o seguinte veículo:") do |table|
    @anuncios = table.hashes                                         #função do ruby que manipula tabelas que não são chaveXvalor
    DAO.new.remover_anuncio(@anuncios.first)
end
    
Dado("eu já cadastrei este anúncio anteriormente") do
    @veiculo = @anuncios.first
    @anuncio_page.novo_anuncio(@veiculo, @blindado)
    @swal.ok
    @nav.vai_para_anuncio
end
  
Dado("este veículo é blindado") do
    @blindado = true
end

Quando("faço o anúncio deste veículo") do
    @veiculo = @anuncios.first
    @anuncio_page.novo_anuncio(@veiculo, @blindado)
end

Quando("faço o anúncio deste veículo sem marca") do
    find('#sell-my-car').click
end

Quando("faço o anúncio deste veículo sem modelo") do
    @veiculo = @anuncios.first
    @anuncio_page.seleciona_marca(@veiculo[:marca])
    find('#sell-my-car').click
end

Então("devo ver a seguinte mensagem de alerta:") do |msg_alerta|
    expect(@anuncio_page.alerta).to have_content msg_alerta
end

Então("devo ver a seguinte mensagem:") do |mensagem|
    expect(@swal.mensagem.text).to eql mensagem
end
