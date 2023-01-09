module VimeoRuby
  module HttpHelper
    extend self

    def make_request(request_obj: nil, uri: nil, access_token: nil, params: {})
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |https|
        request_obj["Authorization"] = "bearer #{access_token}"
        request_obj = add_body_and_content_type_if_patch(request_obj, params: params)

        response = https.request(request_obj)
        JSON.parse(response.body)
      end
    end

    private

    def add_body_and_content_type_if_patch(request_obj, params: {})
      request_obj.body = params.to_json if request_obj.method.eql?("PATCH")
      request_obj.content_type = "application/json" if request_obj.method.eql?("PATCH")
      request_obj
    end
  end
end
