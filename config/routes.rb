Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  resources :generate_invoice, only: [:index] do
  collection do
    get 'customerName', to: 'generate_invoice#customerName'
    get 'itemDetail', to: 'generate_invoice#getItems'
  end
end
end
