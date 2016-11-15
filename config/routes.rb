Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  delete '/logout' => 'sessions#destroy'

  resources :dashboard
  resources :employments
  resources :events
  resources :friendships
  resources :profiles
  resources :sessions
  resources :users
  resources :searched
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]
end
