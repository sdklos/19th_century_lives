Rails.application.routes.draw do

  get '/auth/google/callback' => 'sessions#create'
end
