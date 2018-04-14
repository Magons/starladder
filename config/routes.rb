Rails.application.routes.draw do
  resources :teams, except: [:show]
  root to: 'teams#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
