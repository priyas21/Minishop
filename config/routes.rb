Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :addresses
  end

  namespace :admin do
    resources :users, :addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
