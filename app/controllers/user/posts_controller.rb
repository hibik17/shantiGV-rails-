class User::PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def create
    @post = Post.new(post_parameter)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to user_post_path(@post)
    else
      render :index
    end
  end

  def update
  end

  def delete
  end

  private
  def post_parameter
    params.require(:post).permit(:title, :content, :genre_id, :country_id, :image_id)
  end
end
