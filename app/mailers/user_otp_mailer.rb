class UserOtpMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_otp_mailer.login_otp.subject
  #
  def login_otp
    @user = params[:user]
    @greeting = "Hi"

    mail(
      from: "lorenzo.plantilla.cics@ust.edu.ph",
      to: @user.email, 
      subject: "bahaytubig.herokuapp.com OTP LOGIN REQUEST"
      ) 
  end
end
