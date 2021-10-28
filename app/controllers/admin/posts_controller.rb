class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy!
      flash[:message] = '投稿の削除に成功しました'
      redirect_to admin_posts_path
    else
      flash[:message] = '投稿の削除に失敗しました。再度実行してください'
      @posts = Post.all
      render :index
    end
  end

  def search
    @posts = Post.post_search(params[:keyword])
    if @posts != []
      render :index
    else
      flash[:message] = '検索対象に合致するものはありませんでした'
      redirect_to admin_posts_path
    end
  end
end
