class User::HomesController < ApplicationController

  def top
  end

  def mypage
    @posts = current_user.posts
  end
end
