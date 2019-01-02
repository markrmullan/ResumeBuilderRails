Rails.application.routes.draw do
  # force devise to use our controllers which accept JSON
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  # required for devise, or some undefined method errors will be thrown
  resources :users

  resources :experiences, only: [:create, :update]
  root to: 'home#index'
end
