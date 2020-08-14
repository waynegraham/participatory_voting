# frozen_string_literal: true

##
# Handles checking the captcha for logins
#
# @see https://github.com/heartcombo/devise/wiki/How-To:-Use-Recaptcha-with-Devise#devisepasswordscontroller
#
class PasswordsController < Devise::PasswordsController
  prepend_before_action :check_captcha, only: [:create]

  private

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end
end
