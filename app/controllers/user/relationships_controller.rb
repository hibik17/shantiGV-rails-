class User::RelationshipsController < ApplicationController
  def create
    binding.pry
    follow = current_user.follow(params[:user_id])
    follow.save!
    redirect_to request.referer
  end

  def destroy
    unfollow = current_user.unfollow(params[:user_id])
    unfollow.save!
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
