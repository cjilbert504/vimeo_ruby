module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :vimeo_id, :name, :profile_url, :location, :bio, :additional_info

    def initialize(attrs: {})
      @vimeo_id = extract_id_from_vimeo_user_uri(attrs.delete("uri"))
      @name = attrs.delete("name")
      @profile_url = attrs.delete("link")
      @location = attrs.delete("location")
      @bio = attrs.delete("bio")
      @available_for_hire = attrs.delete("available_for_hire")
      @can_work_remotely = attrs.delete("can_work_remotely")
      @additional_info = attrs
    end

    def self.get_user(id)
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
