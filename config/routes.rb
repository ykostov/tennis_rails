Rails.application.routes.draw do
  devise_for :admins
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'
  get 'pages/admin'
  get '/about', to: "pages#about"
  get '/tour', to: "pages#tour"
  get '/gladiator', to: "pages#gladiator"
  get '/ranklist', to: "pages#ranklist"
  get '/admin', to: "pages#admin"
  root to: 'pages#home'
end
