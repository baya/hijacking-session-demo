Rails.application.routes.draw do
  root 'welcome#index'

  resource :session

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

end
