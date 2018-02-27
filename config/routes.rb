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

  resources :reviews do
    resources :reports, only: [:new, :create]
  end

  resources :reports, only: [:index, :destroy]

  get "add_favourites" => "users#addFavourites"

  get "show_profile" => "users#show"
end
