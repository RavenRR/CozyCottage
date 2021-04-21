class ClientsController < ApplicationController

    def new
        @client = Client.new
    end

    def create

    end

    def index
        @clients = Client.all
    end

    def show 

    end

    def edit 

    end

    def update

    end

    def destroy

    end
end
