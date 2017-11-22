Rails.application.routes.draw do

  resources :cities
  resources :states, only: [:index, :show]
  get '/patriarchs_and_matriarchs', to: 'welcome#patriarchs_and_matriarchs'
  get '/patriarchs_and_matriarchs/:id', to: 'people#show'
  resources :people
  root 'welcome#home'

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks"}

end
