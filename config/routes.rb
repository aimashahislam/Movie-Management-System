Rails.application.routes.draw do
  get 'rake/routes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  
  root "home#index"
  
  namespace :admin do
    resources :movies do
      resources :actors
    end
    resources :actors
  end

end
