require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    user = User.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    assert user.valid?
  end

  test "should require an email" do
    user = User.new(password: "password", password_confirmation: "password")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should require a unique email" do
    existing_user = users(:one) # Assuming you have fixtures set up
    user = User.new(
      email: existing_user.email,
      password: "password",
      password_confirmation: "password"
    )
    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end

end