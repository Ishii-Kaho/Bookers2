Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :homes, only: [:new, :create, :index, :show, :destroy]
end
