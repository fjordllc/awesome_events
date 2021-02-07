Rails.application.routes.draw do
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resource :retirements

  resources :events do
    resources :tickets
  end

  get "status" => "status#index", defaults: { format: "json" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
