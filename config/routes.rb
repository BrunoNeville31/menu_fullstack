Rails.application.routes.draw do
  root "menu/dashboard#index"
  
  namespace :menu do
    resources :product, only: [:show]
    resources :sub_category, only: [:index]
    resources :category, only: [:index]
    resources :company, only: [:show]
  end

  namespace :admin do
    resources :profile, only: [:edit, :update]
    resources :company, only: [:show, :edit, :update]
    resources :product
    resources :sub_category
    resources :category
    resources :dashboard, only: [:index]
  end
  devise_for :admins
  get "up" => "rails/health#show", as: :rails_health_check
end
