Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  get 'homes/parent_top', to: 'homes#parent_top'
  get 'homes/child_top', to: 'homes#child_top'
  get 'homes/giving_top', to: 'homes#giving_top'
  # session
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/child_login',   to: 'child_sessions#new'
  post   '/child_login',   to: 'child_sessions#create'
  delete '/child_logout',  to: 'child_sessions#destroy'
  get    '/giving_login',   to: 'giving_sessions#new'
  post   '/giving_login',   to: 'giving_sessions#create'
  delete '/giving_logout',  to: 'giving_sessions#destroy'
  # resources
  resources :parents
  resources :children
  resources :givings
  resources :posts do
    resource :fins, only: [:create, :destroy]
  end
end
