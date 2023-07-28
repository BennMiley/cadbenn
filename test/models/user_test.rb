require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one , :two) # Replace "one" with the fixture name for a user record
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present' do
    @user.password = ' '
    assert_not @user.valid?
  end

end