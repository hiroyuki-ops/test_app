Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items

end
