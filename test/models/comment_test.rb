require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test '.user_name' do
    note = create(:comment)
    assert_equal note.user.name, note.user_name

    note = create(:comment, user: nil)
    assert_equal '', note.user_name
  end

  test '.user_avatar_url' do
    note = create(:comment, user: nil)
    assert_equal Comment::DEFAULT_AVATAR, note.user_avatar_url

    note = create(:comment)
    assert_equal Comment::DEFAULT_AVATAR, note.user_avatar_url

    user = create(:user)
    user.stub(:avatar_url, '123') do
      Comments.config.stub(:user_avatar_url_method, :avatar_url) do
        note.stub(:user, user) do
          assert_equal '123', note.user_avatar_url
        end
      end
    end
  end

  test '.user_profile_url' do
    note = create(:comment, user: nil)
    assert_equal '#', note.user_profile_url

    note = create(:comment)
    assert_equal "/users/#{note.user_id}", note.user_profile_url
  end
end
