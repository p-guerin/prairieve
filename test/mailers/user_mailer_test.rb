require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "reset password" do
    user = FactoryGirl.create(:user, email: 'yo@foo.com')
    email = UserMailer.reset_password(user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['equipe@simplon.ve'], email.from
    assert_equal [user.email], email.to
    assert_equal I18n.t('user_mailer.reset_password.subject'), email.subject
    assert email.body.include?(user.name)
  end
end
