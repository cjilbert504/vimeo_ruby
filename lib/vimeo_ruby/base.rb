require "json"
require "net/http"
require "vimeo_ruby/http_helper"

module VimeoRuby
  class Base
    include HttpHelper

    attr_reader :access_token, :vimeo_id

    def initialize(access_token: nil, vimeo_id: nil)
      @access_token = access_token
      @vimeo_id = extract_vimeo_id_from_uri(vimeo_id)
    end

    class << self
      def base_uri
        "https://api.vimeo.com"
      end

      def client_identifier
        ENV["VIMEO_CLIENT_IDENTIFIER"]
      end

      def client_secret
        ENV["VIMEO_CLIENT_SECRET"]
      end

      def get(uri, access_token: nil, query_params: {})
        uri = URI.parse(uri)
        uri.query = URI.encode_www_form(query_params)
        request = Net::HTTP::Get.new(uri)

        HttpHelper.make_request(uri: uri, request_obj: request, access_token: access_token, params: query_params)
      end
    end

    def base_uri
      self.class.base_uri
    end

    def patch(uri, access_token: nil, body_params: {})
      uri = URI.parse(uri)
      request = Net::HTTP::Patch.new(uri)

      make_request(uri: uri, request_obj: request, access_token: access_token, params: body_params)
    end

    private

    def define_attribute_reader(attr_name)
      klass = self.class
      klass.define_method(attr_name) { instance_variable_get("@#{attr_name}") } unless klass.method_defined?(attr_name)
    end

    def extract_vimeo_id_from_uri(vimeo_uri)
      vimeo_uri.match(/\d+/)[0].to_i
    end
  end
end
