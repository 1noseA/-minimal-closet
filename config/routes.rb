Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:index, :show, :edit, :update] do
    resources :calendars
    resources :coordinates do
      resource :favorites, only: [:create, :destroy]
    end
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :items do
    resource :likes, only: [:create]
  end

  resources :calendars

  resources :categories
  resources :scenes
  resources :seasons

  root 'homes#top'
  get '/about' => 'homes#about'
end
