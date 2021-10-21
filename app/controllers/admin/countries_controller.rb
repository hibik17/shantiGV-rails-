class Admin::CountriesController < ApplicationController

  def edit
  end

  def index
    @countries = Country.all
    @country = Country.new
  end

  def create
    @country = Country.new(country_parameter)
    if @country.save
      flash[:message] = "新規国名を作成しました"
      redirect_to admin_countries_path
    else
      @countries = Country.all
      render :index
    end
  end

  def update
  end

  def destroy
    country = Country.find(params[:id])
    if country.destroy
      flash[:message] = '削除を完了しました'
      redirect_to admin_countries_path
    else
      flash[:message] = '削除に失敗しました。もう一度やり直してください'
      redirect_to admin_countries_path
    end
  end

  private
  def country_parameter
    params.require(:country).permit(:name)
  end
end
