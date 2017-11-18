Rails.application.routes.draw do
  devise_for :consumers, controllers: {
    sessions: 'consumers/sessions',
    registrations: 'consumers/registrations',
    passwords: 'consumers/passwords'
  }
  
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations',
  	passwords: 'users/passwords'
  }
  
  resources :posts
  root 'posts#index'

  get 'users/:id' => 'users#show', as: 'user'
  get 'consumers/:id' => 'consumers#show', as: 'consumer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
