Rails.application.routes.draw do
  resources :products

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  devise_for :users
  resources :visitors
  resources :users do 
    post 'update_invites',on: :collection
  end
  post 'add_contribution',:to => "visitors#add_contribution"
  post 'revert_contribution',:to => "visitors#revert_contribution"
  post 'add_order',:to => "visitors#add_order"
end
