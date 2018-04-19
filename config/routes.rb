Rails.application.routes.draw do
  # get 'repository/index'

  # get 'repository/show'

  root 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#create'

  delete 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/failure', to: redirect('/')

  get ':username', to: 'repository#show', as: :repository

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
