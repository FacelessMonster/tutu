Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: :create
  end
  resources :railway_stations
  resources :routes
  root "trains#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
