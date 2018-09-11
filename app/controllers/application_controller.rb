# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :set_rand_cookie

  protected

  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end

  private

  def set_rand_cookie
    return if cookies[:rand_seed].present?

    cookies[:rand_seed] = { value: rand, expires: Time.zone.now + 900 }
  end
end
