require "json"
require "net/http"

module VimeoRuby
  class Base
    class << self
      def base_uri
        "https://api.vimeo.com"
      end

      def access_token
        ENV["VIMEO_ACCESS_TOKEN"]
      end

      def client_identifier
        ENV["VIMEO_CLIENT_IDENTIFIER"]
      end

      def client_secret
        ENV["VIMEO_CLIENT_SECRET"]
      end

      def get(uri)
        https, request = build_https_get_request(uri)
        request.basic_auth(client_identifier, client_secret)
        response = https.request(request)
        JSON.parse(response.body)
      end

      private

      def build_https_get_request(uri)
        uri = URI.parse(uri)
        [build_ssl_enabled_http_object(uri.host, uri.port), build_http_get_request_object(uri.path)]
      end

      def build_ssl_enabled_http_object(host, port)
        http = Net::HTTP.new(host, port)
        http.use_ssl = true
        http
      end

      def build_http_get_request_object(path)
        Net::HTTP::Get.new(path)
      end
    end
  end
end
