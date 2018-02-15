Rails.application.routes.draw do
  get 'rake/routes'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'

  namespace :admin do
    resources :movies do
      resources :posters
      resources :actors
    end
    resources :actors
  end

end
