Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :messages, only: [ :new, :create]
  end

  resources :spaces do
    resources :bookings, except: [ :show, :index, :edit, :update ]
  end


  resources :bookings, only: [ :show ] do
    patch :confirm, on: :member
    resources :user_reviews, only: [ :new, :create ]
    resources :space_reviews, only: [ :new, :create ]
  end

  resources :messages, only: [ :index, :create ]
end
