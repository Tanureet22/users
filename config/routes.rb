Rails.application.routes.draw do
  root 'home#index'

  get 'about', to: 'about#index'
  get 'users', to: 'users#show_all'
  get 'languages', to: 'languages#show_all'

  resources :users, only: [:show] do
    resources :languages, only: [:show], controller: 'users/languages'
  end

  resources :languages, only: [:show]

  # Routes for showing the search
  resources :users do
    collection do
      get 'show_all' 
    end
  end

  resources :languages do
    collection do
      get 'show_all' 
    end
  end

end
