class Admin::GenresController < ApplicationController
  def new
  end

  def edit
  end

  def index
    @genres = Genre.all
  end

  def create
    redirect_to admin_genres_path
  end

  def update
    redirect_to admin_genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end

  def genre_search
    if params[:genre_name] != ""
      @genres = Genre.genre_search(params[:genre_name])
      if @genres.count >= 1
        binding.pry
        render :index
      else
        flash[:message] = '一致するものはありませんでした'
        redirect_to admin_genres_path
      end
    else
      flash[:message] = 'ジャンル名を入力してください'
      redirect_to admin_genres_path
    end
  end
  private
  def genre_parameter
    params.require(:genre).permit(:name)
  end
end
