class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :require_login, :require_owner
  
  private
  def require_owner(owned_obj)
    require_login
    if owned_obj.user != current_user
      flash[:error] = "You don't have permission to do that!"
      redirect_to root_url
      return
    end
  end
  def require_login
    if !logged_in?
      session["user_action"] ||= {}
      session["user_action"]["method"] = request.method
      session["user_action"]["url"] = request.url
      redirect_to "/auth/twitter"
    end
  end
  def logged_in?
    !current_user.nil?
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
