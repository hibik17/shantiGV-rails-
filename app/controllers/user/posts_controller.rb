class User::PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :delete]
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_parameter)
    @post.user_id = current_user.id

    # insert post_user
    if params[:post][:post_name] == 'real_name'
      @post.post_user = current_user.name
    elsif params[:post][:post_name] == 'nick_name'
      if current_user.nick_name == nil
        flash[:notice] = "ニックネームが登録されておりません。ユーザー編集画面から登録をしましょう!"
        # nick_name登録のフラグ
        @nick_name_active = false
      else
        @post.post_user = current_user.nick_name
      end
    end

    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to user_post_path(@post)
    else
      render :index
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_parameter)
      flash[:notice] = "投稿の編集が完了しました。"
      redirect_to user_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def post_parameter
    params.require(:post).permit(:title, :content, :genre_id, :country_id, :image, :post_user)
  end

  def correct_user
    @post_user = Post.find(params[:id]).user
    if @post_user != current_user
      flash[:notice] = "権限がありません。編集権限を管理者にお問い合わせください。"
      user_posts_path
    end
  end
end
