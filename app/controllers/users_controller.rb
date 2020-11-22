class UsersController < ApplicationController
  before_action :set_user, only: %i[follow unfollow]

  def index
    @users = policy_scope(User).where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:notice] = "Something went wrong. Try again later."
      render 'index'
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    else
      flash[:notice] = "Something went wrong. Try again later."
      render 'index'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
