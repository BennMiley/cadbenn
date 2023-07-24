require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "John Doe", email: "john@example.com", password: "password")
  end

  # ... your existing tests ...

  test "password should be at least 6 characters long" do
    @user.password = "short"
    assert_not @user.valid?
    assert_includes @user.errors.full_messages, "Password is too short (minimum is 6 characters)"
  end

  test "should encrypt the password" do
    assert_not_nil @user.encrypted_password
  end
end