# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def test_user_has_an_id_attribute
    assert_equal 191447207, VimeoRuby::User.new(191447207).id
  end
end
