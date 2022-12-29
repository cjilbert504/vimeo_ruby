# frozen_string_literal: true

require "ostruct"
require "vimeo_ruby/base"
require "vimeo_ruby/user"
require "vimeo_ruby/user/uploaded_video_collection"
require "vimeo_ruby/version"
require "vimeo_ruby/video"

module VimeoRuby
  class Error < StandardError; end

  class << self
    def get_user(vimeo_id)
      User.get_user(vimeo_id)
    end

    def get_video(vimeo_id)
      Video.get_video(vimeo_id)
    end
  end
end
