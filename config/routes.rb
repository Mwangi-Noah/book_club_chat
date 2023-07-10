Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      resources :book_clubs, only: [:index, :show, :create, :update, :destroy]
      resources :books, only: [:index, :show, :create, :update, :destroy]
      resources :messages, only: [:index, :create]
    end

    resources :book_clubs, only: [:index, :show, :update, :destroy] do
      resources :users, only: [:index]
      resources :books, only: [:index]
      resources :messages, only: [:index, :create]
    end

    resources :memberships, only: [:create, :destroy]
    resources :books, only: [:index, :show, :update]
    resources :readings, only: [:create, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
  end
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
