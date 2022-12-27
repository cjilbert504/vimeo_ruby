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

  def test_user_has_a_vimeo_id
    assert_equal 202558318, @user.vimeo_id
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

  def test_user_has_a_bio
    bio_str = "Writing stories for computers to read."
    assert_equal bio_str, @user.bio
  end

  def test_user_can_indicate_if_they_are_available_for_hire
    assert_equal false, @user.available_for_hire?
  end

  def test_user_can_indicate_if_they_can_work_remotely
    assert_equal false, @user.can_work_remotely?
  end
end
