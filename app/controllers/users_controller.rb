class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      flash.now[:info] = "Fail to create user"
      render :new
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      flash.now[:info] = "Faile to update user"
      render :edit
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end
end
