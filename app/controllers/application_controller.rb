class ApplicationController < ActionController::Base
  include SessionsHelper
  include ProfilesHelper
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
end
