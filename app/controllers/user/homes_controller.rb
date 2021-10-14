class User::HomesController < ApplicationController
  before_action :authenticate_user!

  def top
  end

  def mypage
    @posts = current_user.posts
  end
end
