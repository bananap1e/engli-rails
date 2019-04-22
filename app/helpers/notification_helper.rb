# frozen_string_literal: true

module NotificationHelper
  def readed_circle(notification)
    class_name = notification.read ? 'read' : ''
    "<span class='glyphicon glyphicon-heart notification-item #{class_name}'></span>".html_safe
  end
end
