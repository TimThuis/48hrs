Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#homepage'

  resources :tours, only: [:index, :show] do
    resources :bookings, only: [:new]
  end

  resources :guides, only: [:index, :show]

  namespace :account do
    resources :tours, only: [:new, :create, :edit, :update, :index]

    resources :bookings, only: [:index] do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  namespace :visitor do
    resources :bookings, only: [:index, :show] do
      member do
        patch :cancel
      end
    end
  end
end


