module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :vimeo_id, :name, :profile_url, :location, :bio

    def initialize(attrs: {})
      @vimeo_id = extract_id_from_vimeo_user_uri(attrs.delete("uri"))
      @name = attrs["name"]
      @profile_url = attrs["link"]
      @location = attrs["location"]
      @bio = attrs["bio"]
      @available_for_hire = attrs["available_for_hire"]
      @can_work_remotely = attrs["can_work_remotely"]
    end

    def self.find(id)
      user_info = get("#{base_uri}/users/#{id}")
      new(attrs: user_info)
    end

    def available_for_hire?
      @available_for_hire
    end

    def can_work_remotely?
      @can_work_remotely
    end

    private

    def extract_id_from_vimeo_user_uri(user_uri)
      user_uri.match(/\d+/)[0].to_i
    end
  end
end
