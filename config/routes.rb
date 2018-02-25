Rails.application.routes.draw do

  devise_for :users

  root "home#index"

  namespace :admin do
    resources :movies do
      resources :actors
    end
    resources :actors
    resources :home, only: :index
  end

  resources :movies, :actors, only: [:show, :index]

  resources :movies do
    resources :reviews, except: [:show, :index]
  end

end
