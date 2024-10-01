class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   allow_browser versions: :modern
#   helper_method :current_user

# def current_user
#   if session[:user_id]
#     @current_user  = User.find(session[:user_id])
#   end
# end

# def log_in(user)
#   session[:user_id] = user.id
#   @current_user = user
#   redirect_to root_path
# end

# def logged_in?
#   !current_user.nil?
# end

# def log_out
#   session.delete(:user_id)
#   @current_user = nil
# end


before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_current_account

  def set_current_account
    return unless current_user.present?
    current_account = current_user.account
    ActsAsTenant.current_tenant = current_account
  end
end
