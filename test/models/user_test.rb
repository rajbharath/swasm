require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid mobile number' do
    assert users(:valid_user).validate
  end

  test 'different invalid mobile number formats' do
    error_message = 'Failed validating invalid mobile format'
    assert_not users(:invalid_user_one).validate, error_message
    assert_not users(:invalid_user_two).validate, error_message
    assert_not users(:invalid_user_three).validate, error_message
    assert_not users(:invalid_user_four).validate, error_message
    assert_not users(:invalid_user_five).validate, error_message
    assert_not users(:invalid_user_six).validate, error_message
  end
end
