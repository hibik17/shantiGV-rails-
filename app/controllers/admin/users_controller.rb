class Admin::UsersController < ApplicationController
  before_action authenticate_admin!
  
  def index
    @users = User.with_deleted
  end

  def withdraw
    user = User.find(params[:user_id])
    user.destroy
    redirect_to admin_users_path
  end

  def restore
    user = User.with_deleted.find(params[:user_id])
    user.restore
    redirect_to admin_users_path
  end

  def user_search
    if params[:user_name] != ""
      @users = User.user_search(params[:user_name])
      if @users.count >= 1
        render :index
      else
        flash[:message] = '検索に該当するユーザーはいませんでした。'
        redirect_to admin_users_path
      end
    else
      flash[:message] = 'ユーザー名を入力してください'
      redirect_to admin_users_path
    end
  end

end
