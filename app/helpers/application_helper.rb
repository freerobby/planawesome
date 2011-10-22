module ApplicationHelper
  def is_owner?(obj)
    !session[:user_id].nil? && obj.user_id == session[:user_id]
  end
end
