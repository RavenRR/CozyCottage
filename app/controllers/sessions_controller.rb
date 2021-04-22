class SessionsController < ApplicationController

    def new

    end 

    def create 
        @user = User.find_by(email: params[:user][:email])

        if @user && @user.authenticate(params[:user][:email])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @error = "Invalid"
            redirect_to login_path
        end
    end


    def index

    end


end