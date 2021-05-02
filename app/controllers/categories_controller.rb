class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        @categories = Category.filter_duplicates
        @categories = Category.all.includes(:clients)
    end

    def show 
        @category = Category.find_by_id(params[:id])
    end

    def new
    end
end
