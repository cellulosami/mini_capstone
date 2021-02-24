class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { request.format.html? }

  def display_all
    render json: {message: "hello"}
  end
end
