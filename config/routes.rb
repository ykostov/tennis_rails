Rails.application.routes.draw do
  resources :mesecen_tours
  resources :gladiators
  resources :competitions
  resources :posts
  devise_for :admins
  get 'pages/home'
  get 'pages/about'
  get '/about', to: "pages#about"
  get '/ranklist', to: "pages#ranklist"
  root to: 'pages#home'
end
