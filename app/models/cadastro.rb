class Cadastro < ApplicationRecord
    validates :nome_completo, presence: true
    validates :cpf, presence: true
    validates :email, presence: true    
end
