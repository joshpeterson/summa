# frozen_string_literal: true

Rails.application.routes.draw do
  get 'outline/show'

  get 'reader/show'

  get 'articles/show'

  get 'questions/show'

  get 'treatises/show'

  get 'parts/show'

  get 'browse/', to: 'summa#show'
  get 'read/', to: 'reader#show'
  get 'outline/', to: 'outline#show'

  get '/about' => 'static_pages#about'
  get '/' => 'static_pages#home'

  get '/.well-known/acme-challenge/:id' => 'letsencrypt#verify'

  resources :parts, only: [:show]
  resources :treatises, only: [:show]
  resources :questions, only: [:show]
  resources :articles, only: [:show]
end
