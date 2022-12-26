# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

  def test_user_has_an_id_attribute
    assert_equal 191447207, VimeoRuby::User.new(191447207).id
  end

  def test_user_find
    assert_equal "200", VimeoRuby::User.find(191447207).code
  end
end
