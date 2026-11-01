module ApplicationHelper
  def flash_class(type)
    type.to_s == "alert" ? "flash flash-alert" : "flash flash-notice"
  end
end
