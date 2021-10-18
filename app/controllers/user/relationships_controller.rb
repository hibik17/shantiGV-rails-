class User::RelationshipsController < ApplicationController
  def create
    binding.pry
    if params[:follwer_id] == params[:followed_id]
      flash[:notice] = '自分をフォローすることはできません'
      @user = User.find(params[:follwer_id])
      render template: 'user/users/show'
    else
      follow = current_user.follow(params[:follow_id], params[:followed_id])
      redirect_to request.referer
    end
  end

  def destroy
    unfollow = current_user.unfollow(params[:id])
    redirect_to request.referer  
  end
#————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
