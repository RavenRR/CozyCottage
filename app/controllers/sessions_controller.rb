class SessionsController < ApplicationController

    def new

    end 

    def create 
        if params[:provider] == 'google_oauth2'
            @user = User.from_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid email or password, please try again"
            redirect_to login_path
        end
    end
end


    def index
    end


    def omniauth
        @user = User.from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to "/"
        end
    end

    def destroy 
        session.clear
        redirect_to root_path
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end