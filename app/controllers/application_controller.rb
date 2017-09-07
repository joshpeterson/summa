class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_rack_mini_profiler
  def check_rack_mini_profiler
    Rack::MiniProfiler.authorize_request if params[:rmp]
  end
end
