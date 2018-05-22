# frozen_string_literal: true

##
# Handles checking the captcha for new accounts
#
class RegistrationsController < Devise::RegistrationsController
  # Change this to be any actions you want to protect (defined in devise).
  prepend_before_action :check_captcha, only: [:create]

  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end
  end
end
