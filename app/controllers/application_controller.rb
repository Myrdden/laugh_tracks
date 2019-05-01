class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_csp_header

  def set_csp_header
    response.set_header("Content-Security-Policy", "default-src *; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval'")
  end
end
