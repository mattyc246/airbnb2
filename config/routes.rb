Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  post "listings/:id/verify" => 'listings#verify', as: 'verify_listing'

  resources :listings do
    resource :reservation, only: [:new, :create]
    resource :review, only:[:create, :destroy]
  end

  get '/reservations' => 'reservations#index', as: "reservations"
  delete '/reservations/cancel' => 'reservations#destroy', as: "cancel_reservation"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
