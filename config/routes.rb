Rails.application.routes.draw do
  resources :posts
  devise_for :admins
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'
  get '/about', to: "pages#about"
  get '/tour', to: "pages#tour"
  get '/gladiator', to: "pages#gladiator"
  get '/ranklist', to: "pages#ranklist"
  root to: 'pages#home'
end
