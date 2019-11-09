Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i(show edit update) do
    resources :games, only: %i(index show)
    put :synchronize_games
  end

  get 'home/index'

  root to: "home#index"
end
