Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i(show edit update) do
    resources :games, only: %i(index)
    put :synchronize_games
  end
  resources :games, only: %i(show)
  resources :meetings, only: %i(index show edit update create new) do
    resources :meetings_users, only: %i(create) do
      delete :destroy, on: :collection
    end
  end

  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'

  get 'home/index'

  root to: "home#index"
end
