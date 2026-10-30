module ApplicationHelper
  def is_admin?
    current_user && current_user.role == 'admin'
  end
  def is_user?
    current_user && current_user.role == 'user'
  end
  def is_guest?
    !current_user
  end
end
