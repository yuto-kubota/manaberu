Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  get 'homes/demo', to: 'homes#demo'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :parents
end
