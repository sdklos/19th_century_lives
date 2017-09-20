Rails.application.routes.draw do

  resources :people
  resources :neighborhoods
  resources :boroughs, only: [:index, :show]
  root 'welcome#home'

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks"}

  scope 'people/:id' do
    resources :parents, only: [:new, :create, :destroy]
    resources :spouses, only: [:new, :create, :destroy]
    resources :children, only: [:new, :create, :destroy]
  end
end
