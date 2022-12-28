module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :vimeo_id, :name, :profile_url, :location, :bio, :available_for_hire, :can_work_remotely, :additional_info

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

    def self.get_user(user_id)
      user_info = get("#{base_uri}/users/#{user_id}")
      new(attrs: user_info)
    end

    def self.get_uploaded_videos(user_id, **query_params)
      uploaded_videos_response = get("#{base_uri}/users/#{user_id}/videos", query_params: query_params)
      uploaded_videos = uploaded_videos_response["data"]
      VimeoRuby::User::UploadedVideoCollection.new(uploaded_videos)
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
