# frozen_string_literal: true

require "test_helper"

class TestBase < Minitest::Test
  def test_base_uri
    assert_equal "https://api.vimeo.com", VimeoRuby::Base.base_uri
  end

  def test_access_token
    ENV["VIMEO_ACCESS_TOKEN"] = "1a2b3c4d5e"

    assert_equal "1a2b3c4d5e", VimeoRuby::Base.access_token
  end

  def test_can_succesfully_hit_the_tutorial_endpoint
    vimeo_response = VimeoRuby::Base.tutorial_endpoint_request
    assert_equal "200", vimeo_response.code
  end
end
