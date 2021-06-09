Rails.application.routes.draw do
  resources :match_results do
    collection { post :import }
  end
  resources :teams do
    collection { post :import }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/', to: 'top#index'

  #get '/teams', to: 'teams#index'
  #get '/teams/:id', to: 'teams#show'
end
