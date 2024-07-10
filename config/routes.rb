Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create]
  end

  # root 'posts#index'
  root 'homes#index'

end
