# frozen_string_literal: true

##
# Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'info@diglib.org'
  layout 'mailer'
end
