Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  scope module: :users do
    resource :mypage, only: :show
  end

  resources :users, only: [] do
    resource :follow, only: [:create, :destroy], controller: 'follows'
  end

  namespace :posts do
    resources  :sort, only: %i[index]
    resources  :follow, only: %i[index]
  end

  resources :posts do
    resources :post_comments, only: :create, controller: 'posts/comments'
    resource :like, only: %i[create destroy], controller: 'posts/like'
  end

  # Group routes
  resources :groups do
    resources :posts, only: %i[index show new create], controller: 'groups/posts'
    resources :members, only: %i[create update destroy], controller: 'group_members'
  end
end
