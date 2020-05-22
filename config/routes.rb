Rails.application.routes.draw do
  get 'cardvalues/create'
  get 'transactions/create'
  get 'cards/new'
  get 'sessions/new'
  get 'users/new'
  get 'cards/edit'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/cards',    to: 'cards#show'
  get '/addcard',       to: 'cards#new'
  get  '/analysis',    to: 'cards#analysis'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/recommendations', to: 'recommendations#reco'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :recommendations
  resources :cards
end
