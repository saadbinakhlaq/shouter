module ApplicationHelper
  def namespace_css
    "#{controller.controller_name} #{action_name}"
  end
end
