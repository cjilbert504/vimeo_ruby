# frozen_string_literal: true

require "ostruct"
require "vimeo_ruby/base"
require "vimeo_ruby/user"
require "vimeo_ruby/user/video_collection"
require "vimeo_ruby/version"
require "vimeo_ruby/video"

module VimeoRuby
  class Error < StandardError; end

  class << self
    def get_user(access_token: nil)
      User.get_user(access_token: access_token)
    end

    def get_video(video_id)
      Video.get_video(video_id)
    end
  end
end
