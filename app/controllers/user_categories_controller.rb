class UserCategoriesController < ApplicationController
  def index
    @user_categories = current_user.categories
    @user_chatrooms = Chatroom.joins(:messages).where(messages: { user_id: current_user.id }).distinct
    @shared_articles = Article.joins(:messages).where(messages: { user_id: current_user.id }).distinct
    # @shared_articles = [Article.find(182), Article.find(183)]
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
