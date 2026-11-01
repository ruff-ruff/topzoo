class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user, :logged_in?, :is_admin?, :is_user?, :is_guest?
  before_action :set_current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def set_current_user
    @current_user = current_user
  end
end
