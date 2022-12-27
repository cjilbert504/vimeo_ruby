module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :id, :name, :profile_url, :location, :bio

    def initialize(attrs: {})
      @id = extract_id_from_vimeo_user_uri(attrs.delete("uri"))
      @name = attrs["name"]
      @profile_url = attrs["link"]
      @location = attrs["location"]
      @bio = attrs["bio"]
    end

    def self.find(id)
      user_info = get("#{base_uri}/users/#{id}")
      new(attrs: user_info)
    end

    private

    def extract_id_from_vimeo_user_uri(user_uri)
      user_uri.match(/\d+/)[0].to_i
    end
  end
end
