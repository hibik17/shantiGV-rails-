class Admin::UsersController < ApplicationController
  def index
    @users = User.with_deleted
  end

  def withdraw
    user = User.find(params[:user_id])
    user.destroy
    @users = User.with_deleted
    render :index
  end

  def restore
    user = User.with_deleted.find(params[:user_id])
    user.restore
    @users = User.with_deleted
    render :index
  end

  def user_search
    if params[:user_name] != nil
      @users = User.user_search(params[:user_name])
      if @users.count >= 1
        render :index
      else
        flash[:message] = '検索に該当するユーザーはいませんでした。'
        render :index
      end
    else
      flash[:message] = 'ユーザー名を入力してください'
      @users = User.all
      render :index
    end
  end

end
