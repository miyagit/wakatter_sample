Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  scope module: :users do
    resource :mypage, only: :show
  end

  resources :posts do
    resources :post_comments, only: :create, controller: 'posts/comments'
    resource  :likes, only: %i[create destroy], controller: 'posts/likes'
  end
end
