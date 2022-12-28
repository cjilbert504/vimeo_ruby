# frozen_string_literal: true

require "test_helper"

class TestVideoCollection < Minitest::Test
  def setup
    VCR.use_cassette("test_get_uploaded_videos") do
      vimeo_user_id = 4111735
      @video_collection = VimeoRuby::User.get_uploaded_videos(vimeo_user_id)
    end
  end

  def test_videos_returns_a_collection_of_video_objects
    assert @video_collection.videos.all? VimeoRuby::Video
  end
end
