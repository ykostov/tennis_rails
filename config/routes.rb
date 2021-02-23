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
  get '/ranklist', to: "pages#ranklist"
  patch '/enroll_player', to: "players_in_tours#update"
  root to: 'pages#home'
end
