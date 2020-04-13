Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :post_comments, only: :create, controller: 'posts/comments'
  end
  root 'posts#index'
end
