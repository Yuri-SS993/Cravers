class HomesController < ApplicationController
  def top
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      render :top
    end
  end
  
  def about
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      render :about
    end
  end
end
