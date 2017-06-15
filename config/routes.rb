Rails.application.routes.draw do

  root'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'

end
