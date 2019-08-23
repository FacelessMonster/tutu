Rails.application.routes.draw do
  devise_for :users

  resources :trains do
    resources :carriages, only: [:create, :show]
  end

  resource :search, only: [:show, :new, :edit]

  resources :railway_stations, :tickets, :routes
  root "trains#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
