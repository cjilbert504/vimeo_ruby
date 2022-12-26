# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

  def test_find_instantiates_a_user_after_successful_request
    user = VimeoRuby::User.find(202558318)
    assert_equal 202558318, user.id
    assert_equal "Collin Jilbert", user.name
  end
end
