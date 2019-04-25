Rails.application.routes.draw do
  get 'users/edit'
  get 'film_list/index'
  get 'film_list/create'
  get 'film_list/edit'
  get 'film_list/update'
  get 'film_list/new'
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users
  root 'films#index'
  get 'films/index'
  get 'films/show/:id', to: 'films#show'
  get 'book/:session_id', to: 'films#book'
  resources :users, only: [:edit, :update]
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
