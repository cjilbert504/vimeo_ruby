module VimeoRuby
  class Base
    class << self
      def base_uri
        "https://api.vimeo.com"
      end

      def tutorial_endpoint_request
        uri = URI("#{base_uri}/tutorial")
        Net::HTTP.get_response(uri, {Authorization: "bearer #{ENV["VIMEO_ACCESS_TOKEN"]}"})
      end
    end
  end
end
