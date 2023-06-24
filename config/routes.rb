Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      member do
        post 'likes', to: 'likes#create'
      end
    end
  end

  root 'users#index'
end
