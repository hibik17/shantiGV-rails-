Rails.application.routes.draw do
  root :to => 'user/homes#top'

  devise_for :admins
  devise_for :users, controllers: {
    # deviseの階層を編集した場合は適宜pathを編集してください
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  namespace :admin do
    resources :countries, only: [:new, :index, :edit]
    resources :genres, only: [:new, :edit, :index]
  end

  namespace :user do
    get 'homes/mypage'
    get 'favorites/index'
    get 'posts/research'
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    resources :users, except: [:create, :new] do
      get 'withdraw'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
