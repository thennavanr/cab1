class ApplicationController < ActionController::Base
  before_filter :setup_newrelic_custon_params
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def setup_newrelic_custon_params
   NewRelic::Agent.add_custom_parameters(user_ip: request.remote_ip) 
  end
end
