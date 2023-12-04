class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    @messages = Message.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new

  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path, status: :see_other
  end

  def affiche_image
    # selectionner les image_url des articles de la catégorie sélectionnée
    create
    @images = Chatroom.where(category_id: params[:category_id]).pluck(:image_url)
  end

  def select_image
    @images = Article.all
    render partial: 'select_image'
  end

  def filter
    # cette methode me filtre les chatrooms maj
    @chatrooms = Chatroom.where("title ILIKE ?", "%#{params[:query]}%")
    # et me renvoie au format json du html des chatrooms maj
    render json: { html: render_to_string(partial: "searches/chatrooms_list", locals: { chatrooms: @chatrooms }) }
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:title, :user, :category_id, :image_url, :photo)
  end
end
