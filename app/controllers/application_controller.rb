class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  include SessionsHelper
    
  before_action :require_login
    
  private
    
  def require_login
    unless logged_in?
      flash[:error] = "Vous devez être connecté pour accéder à cette page !"
      redirect_to :login
    end
  end

end


