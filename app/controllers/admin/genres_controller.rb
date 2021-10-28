class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_parameter)
    if @genre.save
      flash[:message] = '新規ジャンル作成しました'
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
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
        @genre = Genre.new
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
