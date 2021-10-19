class User::RelationshipsController < ApplicationController
  def create
    if params[:follwer_id] == params[:followed_id]
      flash[:notice] = '自分をフォローすることはできません'
      @user = User.find(params[:follwer_id])
      redirect_to user_user_path(@user.id)
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
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end
end
