Rails.application.routes.draw do
  resources :months
  devise_for :players, controllers: {
    registrations: 'players/registrations'
  }
  resources :players
  resources :gladiators
  resources :competitions
  resources :posts
  resources :months
  devise_for :admins
  get 'pages/home'
  get 'pages/about'
  get '/about', to: "pages#about"
  get '/ranklist', to: "pages#ranklist"
  get '/old', to: "pages#home"
  root to: 'pages#home'
end
