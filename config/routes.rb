Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'

  get '/register', to: 'users#new'

  resources :users, only: [:create]

  get '/sign_in', to: 'sessions#new'
  

  resources :videos, only: [:show] do
    collection do
      post :search, to: "videos#search"
    end
  end
  resources :categories, only: [:show]
  resoureces :sessions, only: [:create]
end




