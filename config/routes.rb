Rails.application.routes.draw do

  resources :people
  resources :neighborhoods
  resources :boroughs
  root 'welcome#home'

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks"}
end
