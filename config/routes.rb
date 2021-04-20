Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :homes, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
end

