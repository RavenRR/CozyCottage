class ClientsController < ApplicationController

    def new
        @client = Client.new
    end

    def create
        @client = current_user.clients.build(clients_params)
        if @client.save
            redirect_to clients_path
        else
            render :new
        end
    end

    def index
        @clients = Client.all
    end

    def show 
        @client = Client.find_by_id(params[:id])
        redirect_to clients_path if !@client
    end

    def edit 

    end

    def update

    end

    def destroy
    

    end
end
