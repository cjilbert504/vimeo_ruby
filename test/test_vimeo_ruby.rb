# frozen_string_literal: true

require "test_helper"

class TestVimeoRuby < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::VimeoRuby::VERSION
  end

  def test_get_user
    VCR.use_cassette("user_found_successfully") do
      @vimeo_user1 = VimeoRuby.get_user(access_token: ENV["VIMEO_ACCESS_TOKEN"])
    end

    VCR.use_cassette("user_found_successfully") do
      @vimeo_user2 = VimeoRuby::User.get_user(access_token: ENV["VIMEO_ACCESS_TOKEN"])
    end

    assert_equal @vimeo_user1.class, @vimeo_user2.class
    assert_equal @vimeo_user1.vimeo_id, @vimeo_user2.vimeo_id
  end

  def test_get_video
    VCR.use_cassette("video_found_successfully") do
      @vimeo_video1 = VimeoRuby.get_video(697485076)
    end

    VCR.use_cassette("video_found_successfully") do
      @vimeo_video2 = VimeoRuby::Video.get_video(697485076)
    end

    assert_equal @vimeo_video1.class, @vimeo_video2.class
    assert_equal @vimeo_video1.vimeo_id, @vimeo_video2.vimeo_id
  end
end
