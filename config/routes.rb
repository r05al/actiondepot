Rails.application.routes.draw do

  namespace :admin do
  	root :to => "base#index"
    resources :users do
      resources :permissions

      put "permissions", to: "permissions#set",
                         as: "set_permissions"
    end
  end

	root "products#index"

  resources :products do
  	resources :reviews
  end

  resources :users

  resources :files

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
end
