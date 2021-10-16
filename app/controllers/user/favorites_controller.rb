class User::FavoritesController < ApplicationController
  def index
    @user_fav = Array.new
    current_user.favorites.each do |fav|
      @user_fav.insert(0,fav.post)
    end
  end
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    if favorite.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy!
    redirect_back(fallback_location: root_path)
  end

end
