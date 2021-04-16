Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'about' => 'homes#about'
  resources :post_books, only: [:new, :create, :index, :show, :destroy]
end
