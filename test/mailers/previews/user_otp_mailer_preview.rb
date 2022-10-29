 # Preview all emails at http://localhost:3000/rails/mailers/user_otp_mailer
class UserOtpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_otp_mailer/login_otp
  def login_otp
    UserOtpMailer.with(user: User.first).login_otp
  end

end
