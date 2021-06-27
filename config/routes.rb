# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resource :retirements, only: %i[new create]

  resources :events, except: %i[index] do
    resources :tickets, only: %i[new create destroy]
  end

  get 'status' => 'status#index', defaults: { format: 'json' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match '*path' => 'application#error404', via: :all
end
