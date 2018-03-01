class Api::V1::BaseController < ApplicationController
before_action :authorize

protected
  def authorize
    authenticate_or_request_with_http_token do |token, options|
      token == ENV["SECRET_KEY"]
    end
  end

end
