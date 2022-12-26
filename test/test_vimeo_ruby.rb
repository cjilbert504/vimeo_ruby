# frozen_string_literal: true

require "test_helper"

class TestVimeoRuby < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::VimeoRuby::VERSION
  end
end
