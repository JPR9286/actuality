class UserCategoriesController < ApplicationController
  def index
    @user_categories = current_user.categories
  end

  def reset
    current_user.update(user_params)
    redirect_to user_categories_path
  end

  private

  def user_params()
    params.require(:user).permit(category_ids:[])
  end

end
