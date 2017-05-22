Rails.application.routes.draw do

  resources :users,    only: [:new, :create, :update, :edit, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :ducats,   only: [:new, :create, :edit, :show, :update, :destroy]

  root  'static_pages#home'

  match '/home',      to: 'static_pages#home',    via: 'get'
  match '/help',      to: 'static_pages#help',    via: 'get'
  match '/about',     to: 'static_pages#about',   via: 'get'
  match '/contact',   to: 'static_pages#contact', via: 'get'

  match '/sign_up',   to: 'users#new',            via: 'get'
  match '/sign_in',   to: 'sessions#new',         via: 'get'
  match '/sign_out',  to: 'sessions#destroy',     via: 'delete'
  match '/users',     to: 'users#new',            via: 'get'
  match '/edit_user', to: 'users#edit',           via: 'get'

  match '/ducat_create', to: 'ducats#new',        via: 'get'
  match '/edit_ducat',   to: 'ducats#edit',       via: 'get'

  match '*path' => redirect('/'), via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
