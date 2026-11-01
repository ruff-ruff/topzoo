class UsersController < ApplicationController
  layout "sessions", only: %i[new forgotten]
  before_action :require_admin, only: %i[index show]

  def index
    @users = User.order(:username)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def forgotten
    @submitted = request.post?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Your account has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password).tap { |attrs| attrs[:role] = "user" }
  end
end
