Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'
  get '/about', to: "pages#about"

  root to: 'pages#home'
end
