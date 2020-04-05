Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:index,:show,:edit,:update] do
    resource :items
    resource :coordinates
  end

  #resources :categories
  #resources :scenes
  #resources :seasons
  
  root 'homes#top'
  get '/about' => 'homes#about' 
end
