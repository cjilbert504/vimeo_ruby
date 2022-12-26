# frozen_string_literal: true

require "net/http"
require_relative "vimeo_ruby/version"

module VimeoRuby
  class Error < StandardError; end

  class Vimeo
    attr_reader :base_uri

    def initialize
      @base_uri = "https://api.vimeo.com"
    end

    def tutorial_request
      uri = URI("#{base_uri}/tutorial")
      Net::HTTP.get_response(uri, { "Authorization": "bearer #{ENV["VIMEO_ACCESS_TOKEN"]}" })
    end
  end 
end
