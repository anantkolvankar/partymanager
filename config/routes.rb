Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :parties
  resources :menus
  resources :users, only: [:index, :show] do
    post 'update_invites'
  end
  
  post 'add_contribution',:to => "home#add_contribution"
  post 'revert_contribution',:to => "home#revert_contribution"
  post 'add_order',:to => "home#add_order"
  
  root to: 'home#index'
end
