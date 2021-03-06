module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= session_user || cookie_user
  end

  def session_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def cookie_user
      User.find(cookies.permanent.signed[:user_id]) if cookies.permanent.signed[:user_id]
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please login"
      redirect_to login_path 
    end
  end

  def store_location
    session[:redirect_back_url] = request.original_url if request.get?
  end

  def redirect_back_or(default)
    url = session[:redirect_back_url] || default
    redirect_to url
    session[:redirect_back_url] = nil
  end
end
