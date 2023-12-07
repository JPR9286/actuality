class UserCategoriesController < ApplicationController
  def index
    @user_categories = current_user.categories
    @user_chatrooms = Chatroom.joins(:messages)
                   .where(messages: { user_id: current_user.id })
                   .where.not(user_id: current_user.id)
                   .distinct
    @my_chatrooms = Chatroom.where(user_id: current_user.id)
    @shared_articles = Article.joins(:messages).where(messages: { user_id: current_user.id }).distinct
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
