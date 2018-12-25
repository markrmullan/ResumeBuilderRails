Rails.application.routes.draw do
  # force devise to use our controller which accepts JSON
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "home#index"
end
