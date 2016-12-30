Rails.application.routes.draw do
  root 'pages#index'
  
  resources :listings

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }

  resources :users, only: [:show]

  resources :photos, only: [:create, :destroy] do 
    collection do
      get :list
    end
  end

  get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage_listing_basics'
  get 'manage-listing/:id/description' => 'listings#description', as: 'manage_listing-description'
  get 'manage-listing/:id/address' => 'listings#address', as: 'manage_listing-address'
  get 'manage-listing/:id/price' => 'listings#price', as: 'manage_listing-price'   
  get 'manage-listing/:id/photos' => 'listings#photos', as: 'manage_listing-photos'
  get 'manage-listing/:id/calendar' => 'listings#calendar', as: 'manage_listing-calendar'
  get 'manage-listing/:id/bankaccount' => 'listings#bankaccount', as: 'manage_listing-bankaccount'
  get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage_listing-publish'
end
