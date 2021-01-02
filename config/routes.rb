Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'
  get '/about', to: "pages#about"
  get '/tour', to: "pages#tour"
  get '/gladiator', to: "pages#gladiator"

  root to: 'pages#home'
end
