class User::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favoiretes.new(post_id: post.id)
    if favorite.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post_image.id)
    favorite.destroy!
    redirect_back(fallback_location: root_path)
  end

end
