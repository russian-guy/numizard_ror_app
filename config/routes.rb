Rails.application.routes.draw do

  resources :users

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/sign_in', to: 'static_pages#sign_in', via: 'get'
  match '/home',    to: 'static_pages#home',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/sign_up', to: 'users#new',            via: 'get'

  # get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
