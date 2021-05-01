class ClientsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @client = Client.new
    end

    def create
        @client = current_user.clients.build(client_params)
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
        @client = Client.find_by_id(params[:id])
        redirect_to clients_path if !@client || @client.user != current_user
    end

    def update
        @client = Client.find_by_id(params[:id])
        redirect_to clients_path if !@client || @client.user != current_user
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render :edit
    end
end
    def destroy
        @client = Client.find_by_id(params[:id])
        @client.destroy

        redirect_to clients_path
    end
end
private
def client_params
    params.require(:client).permit(:name, :image, :bio)
end
