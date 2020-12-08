Rails.application.routes.draw do
  get 'fields/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'sequel'
    end
  end
  resources :fields
end
