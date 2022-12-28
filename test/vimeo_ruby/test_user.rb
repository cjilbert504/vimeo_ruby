# frozen_string_literal: true

require "test_helper"

class TestUser < Minitest::Test
  def setup
    VCR.use_cassette("user_found_successfully") do
      @user = VimeoRuby::User.get_user(4111735)
    end
  end

  def teardown
    VCR.eject_cassette
  end

  def test_is_of_class_vimeo_ruby_user
    assert_kind_of VimeoRuby::User, @user
  end

  def test_user_has_a_vimeo_id
    assert_equal 4111735, @user.vimeo_id
  end

  def test_user_has_a_name
    assert_equal "Fractal Film Co", @user.name
  end

  def test_user_has_a_profile_link
    assert_equal "https://vimeo.com/fractalfilmco", @user.profile_url
  end

  def test_user_has_a_location
    assert_equal "Truckee, CA", @user.location
  end

  def test_user_has_a_bio
    bio_str = "FRACTAL Film Co is a full service film production company located in mountains of Truckee, CA that specializes in crafting powerful commercial, documentary and branded content.\n\nUtilizing cutting edge industry cinema tools like the RED Dragon 6K camera, Movi gimbal stabilizers, drones and cinema lenses, Fractal strives to tell stories that are not only emotionallycaptivating but also visually stunning and uniquely stylized.\n\nOur core team consists of Directors, Producers, Cinematographers and Editors with deep roots in the industry. We understand the complex process of crafting cinematic stories from pre-production through final delivery, and approach every project with fresh eyes ready to break the rules. Everyone at Fractal is driven by a perfectionism to create enduring images and tell inspiring stories."
    assert_equal bio_str, @user.bio
  end

  def test_user_can_indicate_if_they_are_available_for_hire
    assert_equal false, @user.available_for_hire
    assert_equal false, @user.available_for_hire?
  end

  def test_user_can_indicate_if_they_can_work_remotely
    assert_equal false, @user.can_work_remotely
    assert_equal false, @user.can_work_remotely?
  end

  def test_user_has_additional_info_accessible
    assert_kind_of Hash, @user.additional_info

    %w[capabilities gender short_bio created_time pictures websites metadata location_details skills resource_key account].each do |attr|
      assert_includes @user.additional_info, attr
    end

    %w[uri name link location bio available_for_hire can_work_remotely].each do |attr|
      refute_includes @user.additional_info, attr
    end
  end

  def test_get_uploaded_videos
    VCR.use_cassette(name) do
      response = @user.uploaded_videos
      assert_kind_of VimeoRuby::User::UploadedVideoCollection, response
    end
  end
end
