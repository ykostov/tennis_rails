Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/help'

  root to: 'pages#home'
end
