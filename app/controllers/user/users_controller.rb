class User::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, except: [:index, :withdraw]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました"
      redirect_to user_user_path(current_user.id)
    else
      render :edit
    end
  end

  def withdraw
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:notice] = '退会処理が完了しました。'
      redirect_to root_path
    else
      flash[:notice] = '退会処理に失敗しました。もう一度やり直してください'
      render :withdraw
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nick_name, :profile, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "権限がありません。権限をお問い合わせください"
      redirect_to user_homes_mypage_path
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end
