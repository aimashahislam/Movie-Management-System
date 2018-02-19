Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  
  root "home#index"
  
  namespace :admin do
    resources :movies do
      resources :actors
    end
    resources :actors
    resources :admins
  end
  
  resources :movies, :actors, only: [:show, :index]

end
