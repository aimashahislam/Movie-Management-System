Rails.application.routes.draw do

  get 'static_pages/about'

  get 'static_pages/contact_us'

  get 'static_pages/terms_of_use'

  devise_for :users

  root "home#index"

  namespace :admin do
    resources :movies do
      resources :actors
    end
    resources :actors
    resources :users
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

  get "add_favourites" => "users#add_favourites"
  get "remove_favourites" => "users#remove_favourites"

  get "show_profile" => "users#show"

  namespace :api do
    namespace :v1 do
      resources :movies, :actors, :users, :reviews, :reports, only: [:index, :show]
    end
  end

  get '*path' => redirect('/')
end
