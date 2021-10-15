Rails.application.routes.draw do
  namespace :user do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'countries/new'
    get 'countries/index'
    get 'countries/edit'
  end
  namespace :admin do
    get 'genres/new'
    get 'genres/edit'
    get 'genres/index'
  end
  root :to => 'user/homes#top'

  devise_for :admins
  devise_for :users, controllers: {
    # deviseの階層を編集した場合は適宜pathを編集してください
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  namespace :user do
    get 'homes/mypage'
    resources :posts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
