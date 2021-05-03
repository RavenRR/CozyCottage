class ClientsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_client, only: [:show, :edit, :update, :destroy]
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @client = @user.clients.build
        else 
            @client = Client.new
        end
        @client.build_category
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
        @clients = Client.all.order_by_appointments
    end

    def show 
        redirect_to clients_path if !@client
    end

    def edit 
        redirect_to clients_path if !@client || @client.user != current_user
        @client.build_category if !@client.category
    end

    def update
        redirect_to clients_path if !@client || @client.user != current_user
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render :edit
    end
end
    def destroy
        if !@client || @client.user != current_user
            redirect_to clients_path
        else
        @client.destroy
        redirect_to clients_path
        end
    end
end
private
def client_params
    params.require(:client).permit(:name, :image, :bio, :category_id, category_attributes: [:name])
end
    def set_client
        @client = Client.find_by_id(params[:id])
end
