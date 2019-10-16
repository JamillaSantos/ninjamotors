#Classe de conexão com o bd MongoDB

require 'mongo'

class DAO

    Mongo::Logger.logger = Logger.new('log/mongo.log')          #grava o log do banco na pasta log arquivo mongo.log

    private def client
        str_conn = 'mongodb://aluno:qaninja@ds117719.mlab.com:17719/ninjamotors?retryWrites=false'
        Mongo::Client.new(str_conn)
    end


    def remover_usuario(email)
        usuarios = client[:users]

        usuarios.delete_one('profile.email': email)
    end

    def remover_anuncio(veiculo)
        anuncios = client[:sells]

        anuncios.delete_one(
            'brand': veiculo[:marca],
            'model': veiculo[:modelo],
            'desc': veiculo[:versao]
        )
    end
end