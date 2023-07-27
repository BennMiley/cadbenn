require 'test_helper'

class AdminAuthorizationTest < ActiveSupport::TestCase
  # Define a method to set the current user for testing
  def set_current_user(user)
    @current_user = user
  end

  test 'authorized? returns true for admin user' do
    user = User.new(admin: true)
    set_current_user(user) # Use the custom method to set the current user

    authorization = AdminAuthorization.new

    assert authorization.authorized?(:some_action)
  end

  test 'authorized? returns false for non-admin user' do
    user = User.new(admin: false)
    set_current_user(user) # Use the custom method to set the current user

    authorization = AdminAuthorization.new

    assert_not authorization.authorized?(:some_action)
  end

  test 'authorized? returns false for nil user' do
    set_current_user(nil) # Use the custom method to set the current user

    authorization = AdminAuthorization.new

    assert_not authorization.authorized?(:some_action)
  end
end
