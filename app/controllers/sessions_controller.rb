class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    notice = "Thanks for signing in to plan awesome stuff, #{user.name}!"
    if session["user_action"].nil? || session["user_action"]["method"].to_s.downcase != "get"
      redirect_to root_url, :notice => notice
    else
      redirect_to session["user_action"]["url"]
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You've been signed out"
  end
end
