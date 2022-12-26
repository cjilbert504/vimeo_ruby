# frozen_string_literal: true

require "test_helper"

class TestBase < Minitest::Test
  def test_base_uri
    assert_equal "https://api.vimeo.com", VimeoRuby::Base.base_uri
  end
end
