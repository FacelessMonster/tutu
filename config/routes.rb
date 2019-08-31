Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, only: [:create, :show]
    end

    resources :railway_stations, :routes
  end

  resources :tickets, except: [:edit, :update, :show]
  resource :search, only: [:show, :new, :edit]
  root "searches#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
