Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  scope module: :users do
    resource :mypage, only: :show
  end

  namespace :posts do
    resources  :sort, only: %i[index]
  end

  resources :posts do
    resources :post_comments, only: :create, controller: 'posts/comments'
    resources :likes, only: %i[create destroy], controller: 'posts/likes'
  end
end
