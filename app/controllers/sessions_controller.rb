class SessionsController < ApplicationController
  layout "sessions"
  before_action :require_login, only: :destroy

  def new
  end

  def create
    user = User.find_by("LOWER(username) = ?", params[:username].to_s.downcase)

    if user && user.password == params[:password]
      reset_session
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.username}."
    else
      flash.now[:alert] = "Username or password is incorrect."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have been logged out."
  end
end
