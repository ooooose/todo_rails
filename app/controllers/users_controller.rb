class UsersController < ApplicationController
  before_action :login_require, only: [:index, :edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "登録に成功しました"
      redirect_to users_url
    else
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params) && @user.id == current_user.id
      flash[:success] = "ユーザー情報の編集に成功しました！"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end
  
  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    flash[:success] = "削除に成功しました"
    redirect_to users_url
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to users_url unless @user.id == current_user.id
    end
  
  
end
