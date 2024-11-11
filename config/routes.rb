Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only: :index
  resources :pets, only: [:index, :new, :create, :show]
get 'my_page', to: 'users#my_page'
end
