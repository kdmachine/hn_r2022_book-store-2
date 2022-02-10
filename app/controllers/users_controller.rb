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

  private

  def user_params
    params.require(:user).permit User::PROPERTIES
  end
end
