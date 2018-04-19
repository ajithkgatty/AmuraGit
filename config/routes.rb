Rails.application.routes.draw do
  root 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#create'

  delete 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/failure', to: redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
