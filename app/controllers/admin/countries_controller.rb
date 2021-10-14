class Admin::CountriesController < ApplicationController
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
  def country_parameter
    params.require(:country).permit(:name)
  end
end
