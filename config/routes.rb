Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'articles/:id/summary', to: 'articles#summary', as: 'article_summary'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"

  resources :categories, only: [:show]
  resources :users, only: :show
  resources :user_categories, only: :index do
    collection do
      post :reset
    end
  end

  resources :chatrooms, only: [:new, :create, :index, :show, :destroy] do
    resources :messages, only: :create
  end
  resources :articles, only: :show

  resources :my_chatrooms, only: [:index]
  resources :articles, only: :show
  resources :searches, only: [:index]

end
