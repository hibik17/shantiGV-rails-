class Admin::UsersController < ApplicationController
  def index
    @users = User.with_deleted
  end

  def restore
    user = User.find(:user_id)
    user.restore
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
