Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  delete '/logout' => 'sessions#destroy'



  resources :dashboard
  resources :employments
  resources :events
  resources :friendships do
    member do
      put :double_update
    end
  end
  resources :profiles do
    member do
      get 'preview'
    end
  end
  resources :sessions
  resources :users
  resources :searched
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]
end
