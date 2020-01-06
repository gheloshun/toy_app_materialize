module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end


  # GET THE CURRENT USER THAT IS LOGGED IN
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # CHECK IF THE ANY USER IS LOGGED IN
  def logged_in?
    !current_user.nil?
  end

end
