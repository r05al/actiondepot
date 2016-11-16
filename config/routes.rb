Rails.application.routes.draw do

  namespace :admin do
    resources :users
  end

	root "products#index"

  resources :products do
  	resources :reviews
  end

  resources :users

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
end
