# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'proposals/index'

  resources :proposals do
    member do
      put 'like', to: 'proposals#upvote'
      patch 'like', to: 'proposals#upvote'
    end
  end

  get '/pages/*page' => 'pages#show'

  devise_for :users

  root 'proposals#index'
  # root "pages#show", page: "home"
end
