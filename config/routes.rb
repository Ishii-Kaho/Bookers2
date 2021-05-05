Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :index, :update] do
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :relationships, only: [:create, :destroy]
  # フォローする
  post 'follow/:id' => 'relationships#create', as: 'follow'
  # フォローを外す
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'

end

