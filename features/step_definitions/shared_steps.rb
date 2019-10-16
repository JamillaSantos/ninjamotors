#steps compartilhados entre funcionalidades

# login.feature & cadastro.feature
Então("sou autenticado com sucesso") do
    expect(@nav.menu_usuario.text).to eql @usuario[:nome]   #espera que o texto dentro do elemento "userMenu" seja igual à variável
end