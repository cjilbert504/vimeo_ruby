# frozen_string_literal: true

require "test_helper"

class TestVideo < Minitest::Test
  def setup
    VCR.use_cassette("video_found_successfully") do
      @video = VimeoRuby::Video.get_video(697485076)
    end
  end

  def teardown
    VCR.eject_cassette
  end

  def test_is_of_class_vimeo_ruby_video
    assert_kind_of VimeoRuby::Video, @video
  end

  def test_video_has_a_vimeo_id
    assert_equal 697485076, @video.vimeo_id
  end

  def test_video_has_a_description
    assert_equal "Come on, go ahead, ask Zillow anything!", @video.description
  end

  def test_video_has_a_duration
    assert_equal 1122, @video.duration
  end

  def test_video_has_embed_html
    embed_html_str = "<iframe src=\"https://player.vimeo.com/video/697485076?h=545673a8c6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=260485\" width=\"1920\" height=\"1080\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen title=\"Ask Zillow Anything - Pilot\"></iframe>"
    assert_equal embed_html_str, @video.embed_html
  end

  def test_video_has_a_link
    assert_equal "https://vimeo.com/697485076", @video.link
  end

  def test_video_has_a_name
    assert_equal "Ask Zillow Anything - Pilot", @video.name
  end

  def test_video_has_a_player_embed_url
    assert_equal "https://player.vimeo.com/video/697485076?h=545673a8c6", @video.player_embed_url
  end

  def test_video_has_a_type
    assert_includes %w[live stock video], @video.type
  end

  def test_video_belongs_to_a_user
    assert_kind_of VimeoRuby::User, @video.user
  end

  def test_video_has_additional_info_accessible
    assert_kind_of Hash, @video.additional_info
  end
end
