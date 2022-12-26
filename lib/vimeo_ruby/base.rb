module VimeoRuby
  class Base
    class << self
      def base_uri
        "https://api.vimeo.com"
      end

      def access_token
        ENV["VIMEO_ACCESS_TOKEN"]
      end

      def get(uri, headers = {})
        Net::HTTP.get_response(uri, headers)
      end

      def tutorial_endpoint_request
        uri = URI("#{base_uri}/tutorial")
        get(uri, Authorization: "bearer #{access_token}")
      end
    end
  end
end
