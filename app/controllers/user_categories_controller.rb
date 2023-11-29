class UserCategoriesController < ApplicationController
  def index
    @user_categories = UserCategory.all
    
  end
end
