module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :id, :name

    def initialize(attrs: {})
      @id = extract_id_from_vimeo_user_uri(attrs.delete("uri"))
      @name = attrs["name"]
    end

    def self.find(id)
      response = get("#{base_uri}/users/#{id}")
      user_info = JSON.parse(response.body)
      new(attrs: user_info)
    end

    private

    def extract_id_from_vimeo_user_uri(user_uri)
      user_uri.match(/\d+/)[0].to_i
    end
  end
end
