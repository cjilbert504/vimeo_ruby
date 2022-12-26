# frozen_string_literal: true

require "test_helper"

class TestVimeoRuby < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::VimeoRuby::VERSION
  end

  def test_can_succesfully_hit_the_tutorial_endpoint
    vimeo_response = VimeoRuby::Vimeo.new.tutorial_request
    assert_equal "200",  vimeo_response.code
  end
end
