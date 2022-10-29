require 'test_helper'

class UserOtpMailerTest < ActionMailer::TestCase
  test "login_otp" do
    mail = UserOtpMailer.login_otp
    assert_equal "Login otp", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
