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
  
  resources :consumers, only: [:index, :show] do
    get :order_posts, on: :member
  end

  resources :posts do
    resource :order_posts, only: [:create, :destroy]
  end
  root 'posts#index'

  get 'users/:id' => 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
