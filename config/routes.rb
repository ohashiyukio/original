Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only: :index
  resources :pets do
end
end