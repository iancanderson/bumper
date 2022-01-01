Rails.application.routes.draw do
  get "pages/about", as: :about
  root "songs#index"
end
