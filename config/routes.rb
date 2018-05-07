Rails.application.routes.draw do
  root 'films#index'
  get 'films/index'
  get 'films/show/:id', to: 'films#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
