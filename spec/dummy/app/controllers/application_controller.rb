class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render nothing: true
  end

  def subdomain
    render nothing: true
  end

  def blog
    render nothing: true
  end
end
