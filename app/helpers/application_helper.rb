module ApplicationHelper
  # Displays object errors
  #
  def error_messages_for(object = nil)
    render('shared/form_errors', locals: {object: object}) unless object.blank?
  end
end
