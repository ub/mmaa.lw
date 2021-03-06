class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :admin_signed_in?
  helper_method :correct_user?
  helper_method :can_change?

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def admin_signed_in?
    return true if current_user&.admin?
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def can_change?(activity_application)
    return activity_application.user.present? && activity_application.user == current_user
  end


  def authenticate_user!
    if !current_user
      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    end
  end

  def authenticate_admin!
    authenticate_user!
    if current_user
      render file: Rails.root.join('public/403.html'), status: :forbidden unless current_user.admin?
    end
  end


end
