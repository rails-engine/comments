require 'test_helper'

class CommentsTest < ActiveSupport::TestCase
  test ".config" do
    assert_kind_of Comments::Configuration, Comments.config
    assert_equal 'User', Comments.config.user_class
    assert_equal 'current_user', Comments.config.current_user_method
    assert_equal 'authenticate_user!', Comments.config.authenticate_user_method
    assert_equal 'profile_url', Comments.config.user_profile_url_method
    assert_equal nil, Comments.config.user_avatar_url_method
    assert_equal 'name', Comments.config.user_name_method
  end
end
