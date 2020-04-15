Rails.application.routes.draw do
  # force devise to use our controllers which accept JSON
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }, defaults: { format: :json }
  # required for devise, or some undefined method errors will be thrown
  resources :users, defaults: { format: :json }
  get '/users/current', to: 'users#show'

  resources :resumes, only: [:index, :show, :create, :update, :destroy], defaults: { format: :json } do
    resources :experiences, only: [:index, :create, :update, :destroy], defaults: { format: :json }
  end
  root to: 'home#index'
end
