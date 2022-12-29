require "json"
require "net/http"

module VimeoRuby
  class Base
    attr_reader :access_token, :vimeo_id, :additional_info

    def initialize(access_token: nil, vimeo_id: nil, remaining_attrs: {})
      @access_token = access_token
      @vimeo_id = extract_vimeo_id_from_uri(vimeo_id)
      @additional_info = OpenStruct.new(remaining_attrs)
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

      def get(uri, query_params: {}, access_token: nil)
        uri = URI.parse(uri)
        uri.query = URI.encode_www_form(query_params)

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |https|
          request = Net::HTTP::Get.new(uri)
          request["Authorization"] = "bearer #{access_token}"

          response = https.request(request)
          JSON.parse(response.body)
        end
      end
    end

    private

    def extract_vimeo_id_from_uri(vimeo_uri)
      vimeo_uri.match(/\d+/)[0].to_i
    end
  end
end
