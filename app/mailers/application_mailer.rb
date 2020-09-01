class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDGRID_FROM']
  layout 'mailer'
end
