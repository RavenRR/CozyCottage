class UsersController < ApplicationController
    #loads signup form
    def new
        @user = User.new
    end
end