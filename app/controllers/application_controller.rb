class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception

  # According to 'https://github.com/ryanb/cancan/issues/835#issuecomment-18663815'
  # We need this until CanCan fix the bug
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  #before_action :at_least_SCHOLAR_or_redirect , only:[:new,:create,:delete,:update]
  after_filter :store_location

  def store_location
	 # store last url - this is needed for post-login redirect to whatever the user last visited.
	    if (request.fullpath != "/users/sign_in" && \
	        request.fullpath != "/users/sign_up" && \
          request.fullpath != "/users/sign_out" && \
          request.fullpath != "/users" && \
	        request.fullpath[0..10] != "/users/auth" && \
	        request.fullpath != "/users/password" && \
	        !request.xhr?) # don't store ajax calls
	      session[:previous_url] = request.fullpath 
	    end
   end

   def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
   end

   def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
   end

  # Handle CanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to help_manage_url, notice: "您没有权限执行此操作"
  end
end
