class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to tasks_url
      flash[:success] = "ようこそ#{user.name}さん！ログインに成功しました"
    else
      render 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to login_url
  end
  
  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
