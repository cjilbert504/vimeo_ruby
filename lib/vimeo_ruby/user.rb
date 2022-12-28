module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :vimeo_id, :available_for_hire, :bio, :can_work_remotely, :location, :name, :profile_link, :additional_info

    def initialize(attrs: {})
      @vimeo_id = extract_vimeo_id_from_uri(attrs.delete("uri"))
      @available_for_hire = attrs.delete("available_for_hire")
      @bio = attrs.delete("bio")
      @can_work_remotely = attrs.delete("can_work_remotely")
      @location = attrs.delete("location")
      @name = attrs.delete("name")
      @profile_link = attrs.delete("link")
      @additional_info = attrs
    end

    def self.get_user(user_id)
      user_info = get("#{base_uri}/users/#{user_id}")
      new(attrs: user_info)
    end

    def base_uri
      self.class.base_uri
    end

    def uploaded_videos(query_params: {})
      uploaded_videos_response = self.class.get("#{base_uri}/users/#{vimeo_id}/videos", query_params: query_params)
      uploaded_videos = uploaded_videos_response["data"]
      VimeoRuby::User::UploadedVideoCollection.new(uploaded_videos)
    end

    def available_for_hire?
      @available_for_hire
    end

    def can_work_remotely?
      @can_work_remotely
    end
  end
end
