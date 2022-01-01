Rails.application.routes.draw do
  root "songs#index"
  resources :recordings, only: :index
  get "pages/about", as: :about
end
