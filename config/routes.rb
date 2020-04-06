Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:index,:show,:edit,:update]
  resources :items
  resources :coordinates
  resources :calendars

  #resources :categories
  #resources :scenes
  #resources :seasons

  root 'homes#top'
  get '/about' => 'homes#about' 
end
