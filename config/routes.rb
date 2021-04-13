Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :posts do
    resource :likes, only: %i[create destroy]
  end
  get "home/about" => "home#about"
end
