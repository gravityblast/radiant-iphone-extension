class Iadmin::DashboardController < ApplicationController
  layout 'iphone'
  
  skip_before_filter :authenticate, :only => :login
  
  def index
  end
  
  def login
    if current_user
      redirect_to(:action => 'index')    
    elsif request.post?
      login = params[:user][:login]
      password = params[:user][:password]
      puts params[:user].inspect
      puts "*"*50
      if self.current_user = User.authenticate(login, password)
        redirect_to(:action => 'index')
      end
    end    
  end
  
  def logout
    cookies[:session_token] = { :expires => 1.day.ago }
    self.current_user.forget_me
    self.current_user = nil
    redirect_to iadmin_login_url
  end
  
end
