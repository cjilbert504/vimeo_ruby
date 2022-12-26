# frozen_string_literal: true

require "net/http"
require_relative "vimeo_ruby/version"

module VimeoRuby
  class Error < StandardError; end

  class Vimeo
    attr_reader :base_uri

    def initialize
      @base_uri = URI("https://api.vimeo.com/tutorial")
    end

    def tutorial_request
      Net::HTTP.get_response(base_uri, { "Authorization": "bearer #{ENV["VIMEO_ACCESS_TOKEN"]}" })
    end
  end 
end
