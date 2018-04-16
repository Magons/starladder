Rails.application.routes.draw do
  root to: 'teams#index'

  resources :teams, except: [:show]
  resources :tournaments, only: [:index, :show] do
    get 'participate', on: :member
    get 'leave', on: :member
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
