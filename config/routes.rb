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
    resources :posts do
      resource :favorite, only: [:create, :destroy]
    end
    resources :users, except: [:create, :new] do
      get 'withdraw'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
