module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?

    redirect_to login_path, alert: "Please log in to continue."
  end

  def require_admin
    return if current_user&.admin?

    redirect_to root_path, alert: "That area is restricted to administrators."
  end

  def is_admin?
    current_user&.admin?
  end

  def is_user?
    logged_in? && !current_user.admin?
  end

  def is_guest?
    !logged_in?
  end
end
