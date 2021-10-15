class User::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました"
      redirect_to user_users_edit_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nick_name, :email, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "権限がありません。権限をお問い合わせください"
      redirect_to user_homes_mypage_path
    end
  end

  def find_user
    @user = User.find(parmas[:id])
  end
end
