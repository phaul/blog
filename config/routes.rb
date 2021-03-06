Rails.application.routes.draw do
  get 'stats/show'

  resources :sessions, only: [ :new, :create ]
  delete '/logout', to: 'sessions#destroy'
  root to: 'blogposts#index', page: 1
  
  resources :blogposts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
