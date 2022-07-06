Rails.application.routes.draw do
  get "about", to: "about#index"

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  root to: "main#index"
end
