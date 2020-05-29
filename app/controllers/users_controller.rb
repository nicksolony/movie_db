class UsersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    
    if params[:id]==current_user.id.to_s
      @user=current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def edit

  end

  def destroy

  end
end
