class UsersController < ApplicationController
    #loads signup form
    def new
        @user = User.new
    end
        #signup
        def create
            @user = User.new(user_params)
            if @user.save
                #log user in
                session[:user_id] = @user.id
                #redirect to show page
                redirect_to @user
            else
                render :new
            end
        end
        def show
            @user = User.find_by_id(params[:id])
            redirect_to '/' if !@user
        end

        private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end