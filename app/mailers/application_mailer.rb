class ApplicationMailer < ActionMailer::Base
  #to be changed after being given the official company email
  default from: 'lorenzo.plantilla.cics@ust.edu.ph'
  layout 'mailer'
end