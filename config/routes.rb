Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index' 
  resources :diaries, only: [:show, :new, :create]  
  resources :pets, only: [:new, :create, :show]
  resources :questions, only: [:show, :new, :create] do
    resources :questions_answers, only: :create
  collection do
    get 'search'
  end
  end 

get 'my_page', to: 'users#my_page', as: 'my_page'
get 'users/:id/my_page', to: 'users#my_page', as: 'user_my_page'
end
