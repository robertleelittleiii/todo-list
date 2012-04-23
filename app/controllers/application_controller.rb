class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate,
   :except => :login

  private
  
    
  def authenticate
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      #    puts("redirected to admin/login.")
      redirect_to(:controller => "admin" , :action => "login" )
    end

  end
end
