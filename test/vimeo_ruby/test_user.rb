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
    assert_equal 202558318, VimeoRuby::User.new(202558318).id
  end

  def test_user_find
    assert_equal "200", VimeoRuby::User.find(202558318).code
  end
end
