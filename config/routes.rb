Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'

  get '/register', to: 'users#new'

  resources :users, only: [:create]

  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'

  get '/home', to: 'videos#index'

  get 'my_queue', to: "queue_items#index"

  post 'update_queue', to: "queue_items#update_queue"
  
  resources :queue_items, only: [:create, :destroy]
  

  resources :videos, only: [:show] do
    collection do
      post :search, to: "videos#search"
    end

    resources :reviews, only: [:create]
  end

  resources :categories, only: [:show]
  resources :sessions, only: [:create]
end






