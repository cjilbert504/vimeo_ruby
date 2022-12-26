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
        http, request = build_https_request(uri)
        request.basic_auth(client_identifier, client_secret)
        http.request(request)
      end

      def tutorial_endpoint_request
        get("#{base_uri}/tutorial")
      end

      private

      def build_https_request(uri)
        uri = URI.parse(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri.path)
        [http, request]
      end
    end
  end
end


