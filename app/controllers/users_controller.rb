class UsersController < ApplicationController
  before_action :load_user, except: %i(new create)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "success"
      redirect_to root_path
    else
      flash.now[:danger] = t "sign_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "updated"
      redirect_to @user
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit User::PROPERTIES
  end
end
