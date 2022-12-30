# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def setup
    VCR.use_cassette("user_found_successfully") do
      @user = VimeoRuby::User.get_user(access_token: ENV["VIMEO_ACCESS_TOKEN"])
    end
  end

  def teardown
    VCR.eject_cassette
    WebMock.reset!
  end

  def test_is_of_class_vimeo_ruby_user
    assert_kind_of VimeoRuby::User, @user
  end

  def test_user_has_a_vimeo_id
    assert_equal 191447207, @user.vimeo_id
  end

  def test_user_can_indicate_if_they_are_available_for_hire
    assert_equal false, @user.available_for_hire
    assert_equal false, @user.available_for_hire?
  end

  def test_user_has_a_bio
    bio_str = "Writing stories for computers to read."
    assert_equal bio_str, @user.bio
  end

  def test_user_can_indicate_if_they_can_work_remotely
    assert_equal false, @user.can_work_remotely
    assert_equal false, @user.can_work_remotely?
  end

  def test_user_has_a_location
    assert_equal "Covington, LA, USA", @user.location
  end

  def test_user_has_a_name
    assert_equal "Collin Jilbert", @user.name
  end

  def test_user_has_a_profile_link
    assert_equal "https://vimeo.com/user191447207", @user.profile_link
  end

  def test_user_has_additional_info_accessible
    assert_kind_of OpenStruct, @user.additional_info

    currently_parsed_and_assigned_attributes = %i[uri name link location bio available_for_hire can_work_remotely]
    currently_parsed_and_assigned_attributes.each do |attr|
      refute_includes @user.additional_info.table, attr
    end

    remaining_attributes = %i[capabilities gender short_bio created_time pictures websites metadata location_details skills resource_key account]
    remaining_attributes.each do |attr|
      assert_includes @user.additional_info.table, attr
    end
  end

  def test_get_uploaded_videos
    VCR.use_cassette(name) do
      assert_kind_of VimeoRuby::User::VideoCollection, @user.uploaded_videos
    end
  end

  def test_doesnt_make_request_for_uploaded_videos_again_if_query_params_are_empty
    VCR.use_cassette(name) do
      @user.uploaded_videos
      @user.uploaded_videos
      assert_requested :get, "https://api.vimeo.com/me/videos", times: 1
    end
  end

  def test_get_video_feed
    VCR.use_cassette(name) do
      assert_kind_of VimeoRuby::User::VideoCollection, @user.video_feed
    end
  end
end
