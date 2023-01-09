module VimeoRuby
  module HttpHelper
    extend self

    def make_request(request_obj: nil, uri: nil, access_token: nil, params: {})
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |https|
        request_obj["Authorization"] = "bearer #{access_token}"
        request_obj.body = params.to_json if request_obj.method.eql?("PATCH")
        request_obj.content_type = "application/json" if request_obj.method.eql?("PATCH")

        response = https.request(request_obj)
        JSON.parse(response.body)
      end
    end
  end
end
