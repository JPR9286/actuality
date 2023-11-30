class UserCategoriesController < ApplicationController
  def index
    @user_categories = current_user.categories
  end

  def receive_checked_values
    checked_values = params[:checkedValues]


    puts checked_values
    # Traiter les valeurs cochées
    # Vous pouvez remplacer cette partie par votre propre logique de traitement

    render json: { status: 'success' }
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
