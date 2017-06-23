Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/boss', as: 'rails_admin'
  devise_for :shippers
  
  devise_for :drivers
  
  resources :shippers
  get 'shipper_dash', to: 'shippers#dashboard'
  
  devise_for :carriers
  resources :carriers
  get 'carrier/dashboard', to: 'carriers#dashboard', as: 'carrier_dash'

  resources :trucks
  
  resources :drivers
  
  devise_for :admins
  resources :admins
  get 'admin_dash', to: 'admins#dashboard'
  
  get 'static_pages/home'
  root 'static_pages#home'
  
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
