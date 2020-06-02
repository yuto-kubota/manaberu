Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  get 'homes/demo', to: 'homes#demo'
  get 'homes/parent_top', to: 'homes#parent_top'
  get 'homes/child_top', to: 'homes#child_top'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/child_login',   to: 'child_sessions#new'
  post   '/child_login',   to: 'child_sessions#create'
  delete '/child_logout',  to: 'child_sessions#destroy'
  resources :parents
  resources :children
end
