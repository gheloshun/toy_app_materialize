class SessionsController < ApplicationController

  def new
    if !current_user.nil?
      redirect_to users_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid Email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end
