class Admin::GenresController < ApplicationController
  def new
  end

  def edit
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def genre_parameter
    params.require(:genre).permit(:name)
  end
end
