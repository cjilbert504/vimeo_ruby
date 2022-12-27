# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def setup
    VCR.use_cassette("user_found_successfully") do
      @user = VimeoRuby::User.find(202558318)
    end
  end

  def teardown
    VCR.eject_cassette
  end

  def test_user_has_an_id
    assert_equal 202558318, @user.id
  end

  def test_user_has_a_name
    assert_equal "Collin Jilbert", @user.name
  end

  def test_user_has_a_profile_link
    assert_equal "https://vimeo.com/user202558318", @user.profile_url
  end

  def test_user_has_a_location
    assert_equal "Covington, LA, USA", @user.location
  end
end
