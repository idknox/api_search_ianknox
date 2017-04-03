Rails.application.routes.draw do

  root to: 'home#show'

  get '/search', to: 'search#show'
end
