class ClientsController < ApplicationController
    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: client
        else
            render json: { error: "Client does not exist" }, status: :not_found
        end
    end

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def update
        client = Client.find_by(id: params[:id])
        if client
            client.update(client_params)
            render json: client, status: :ok
        else
            render json: { error: "Client does not exist" }, status: :not_found
        end
    end

    private

    def client_params
        params.permit(:name, :age)
    end
end
