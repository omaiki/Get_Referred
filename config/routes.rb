Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :dashboard
  resources :employments
  resources :events
  resources :friendships
  resources :profiles
  resources :sessions
  resources :users
  resources :searched

  resources :messages do
    resources :responses
  end
end
