Rails.application.routes.draw do
  get 'items/create'

  get 'users/show'

  get 'welcome/index'

  devise_for :users

  resources :users do
    resources :items, only: [:create, :destroy]
  end

  root 'users#current_user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
