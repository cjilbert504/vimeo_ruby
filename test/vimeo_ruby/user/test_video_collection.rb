# frozen_string_literal: true

require "test_helper"

class TestVideoCollection < Minitest::Test
  def setup
    VCR.use_cassette("test_get_uploaded_videos") do
      VCR.use_cassette("user_found_successfully") do
        @user = VimeoRuby::User.get_user(access_token: ENV["VIMEO_ACCESS_TOKEN"])
      end
      @video_collection = @user.get_uploaded_videos
    end
  end

  def test_videos_returns_a_collection_of_video_objects
    assert @video_collection.videos.all? VimeoRuby::Video
  end
end
