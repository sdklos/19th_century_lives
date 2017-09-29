Rails.application.routes.draw do

  resources :cities
  resources :states, only: [:index, :show]
  get '/people/patriarchs_and_matriarchs', to: 'people#patriarchs_and_matriarchs'
  resources :people
  root 'welcome#home'

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks"}

end
