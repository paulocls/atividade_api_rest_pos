module Api
    module V1
        class CadastrosController < ApplicationController
            def index
                cadastros = Cadastro.order('created_at ASC')
                render json: {status: 'SUCESS', message: 'Cadastros Salvos', data: cadastros}, status: :ok
            end
            def show
                cadastro = Cadastro.find(params[:id])
                render json: {status: 'SUCESS', message: 'Cadastro Salvo', data: cadastro}, status: :ok
            end
            def create
                cadastro = Cadastro.new(cadastro_params)
                if cadastro.save
                render json: {status: 'SUCESS', message: 'Cadastro Salvo', data: cadastro}, status: :ok
                else
                render json: {status: 'ERROR', message: 'Cadastro não salvo', data: cadastro.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                cadastro = Cadastro.find(params[:id])
                cadastro.destroy
                render json: {status: 'SUCESS', message: 'Cadastro Apagado', data: cadastro}, status: :ok
            end

            def update
                cadastro = Cadastro.find(params[:id])
                if cadastro.update(cadastro_params)
                    render json: {status: 'SUCESS', message: 'Cadastro Atualizado', data: cadastro}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Cadastro não atualizado', data: cadastro.errors}, status: :unprocessable_entity
                end
            end         
            private

            def cadastro_params
                params.permit(:nome_completo, :cpf, :email)
            end
        end
    end
end
