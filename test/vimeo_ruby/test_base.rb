# frozen_string_literal: true

require "test_helper"

class TestBase < Minitest::Test
  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

  def test_base_uri
    assert_equal "https://api.vimeo.com", VimeoRuby::Base.base_uri
  end

  def test_access_token
    skip
  end

  def test_client_identifier
    skip
  end

  def test_client_secret
    skip
  end
end
