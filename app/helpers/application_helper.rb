module ApplicationHelper
  def system_messages
    if flash[:notice]
      render partial: 'shared/notice'
    elsif flash[:alert]
      render partial: 'shared/alert'
    end
  end

  def form_messages(value)
    render partial: 'shared/forms_alert', locals: { value: value } if value.errors.any?
  end
end
