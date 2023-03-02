Rails.application.routes.draw do
  root to: 'homes#top'
  
  get 'home/about', to: 'homes#about'
  
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :likes
    end
  end
  
  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
