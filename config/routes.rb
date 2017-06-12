Rails.application.routes.draw do
  devise_for :shippers
  devise_for :carriers
  devise_for :drivers
  resources :shippers
  resources :carriers
  resources :drivers
  resources :trucks
  devise_for :admins
  get 'static_pages/home'
  root 'static_pages#home'
  get 'admins/index'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
