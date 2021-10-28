class Admin::CountriesController < ApplicationController
  before_action :authenticate_admin!
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

  def country_search
    if params[:country_name] != nil
      @countries = Country.country_search(params[:country_name])
      if @countries.count >= 1
        @country = Country.new
        redirect_to admin_countries_path
      else
        flash[:message] = '検索対象はありませんでした。'
        redirect_to admin_countries_path
      end
    else
      flash[:message] = '国名を入力してください'
      render :index
    end
  end

  private
  def country_parameter
    params.require(:country).permit(:name)
  end
end
