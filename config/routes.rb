Rails.application.routes.draw do
  # force devise to use our controllers which accept JSON
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }, defaults: { format: :json }
  # required for devise, or some undefined method errors will be thrown
  resources :users

  resources :experiences, only: [:index, :create, :update], defaults: { format: :json }
  resources :resumes, only: [:index, :create, :update], defaults: { format: :json }
  root to: 'home#index'
end
