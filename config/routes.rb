Rails.application.routes.draw do
  devise_for :players, controllers: {
    registrations: 'players/registrations'
  }
  resources :players
  resources :gladiators
  resources :competitions
  resources :posts
  devise_for :admins
  get 'pages/home'
  get 'pages/about'
  get '/about', to: "pages#about"
  get '/ranking', to: "pages#ranking"
  root to: 'pages#home'
end
