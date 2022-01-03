Rails.application.routes.draw do
  passwordless_for :users

  root "songs#index"
  resources :recordings, only: :index
  resources :songs, only: [:new, :create]
  get "pages/about", as: :about
end
