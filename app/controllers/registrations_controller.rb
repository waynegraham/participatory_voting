# frozen_string_literal: true

##
# Handles checking the captcha for logins
#
# @see https://github.com/heartcombo/devise/wiki/How-To:-Use-Recaptcha-with-Devise#deviseregistrationscontroller
#
class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides reCAPTCHA
      set_minimum_password_length
      respond_with_navigational(resource) { render :new }
    end
  end
end
