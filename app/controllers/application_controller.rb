class ApplicationController < ActionController::Base
  protect_from_forgery
  
  set_current_tenant_through_filter
  before_filter :set_current_tenant_by_user
  
  
  private 
  
  def set_current_tenant_by_user
    set_current_tenant(current_user)
  end
  
end
