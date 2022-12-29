module VimeoRuby
  class User < Base
    attr_reader :vimeo_id, :video_collection, :available_for_hire, :bio, :can_work_remotely, :location, :name, :profile_link, :additional_info

    def initialize(attrs: {})
      @vimeo_id = extract_vimeo_id_from_uri(attrs.delete("uri"))
      @available_for_hire = attrs.delete("available_for_hire")
      @bio = attrs.delete("bio")
      @can_work_remotely = attrs.delete("can_work_remotely")
      @location = attrs.delete("location")
      @name = attrs.delete("name")
      @profile_link = attrs.delete("link")
      @video_collection = nil
      @additional_info = OpenStruct.new(attrs)
    end

    def self.get_user(user_id)
      user_info = get("#{base_uri}/users/#{user_id}")
      new(attrs: user_info)
    end

    def base_uri
      self.class.base_uri
    end

    def uploaded_videos(query_params: {})
      if @video_collection.nil? || !query_params.empty?
        uploaded_videos_response = self.class.get("#{base_uri}/users/#{vimeo_id}/videos", query_params: query_params)
        uploaded_videos = uploaded_videos_response["data"]
        @video_collection = UploadedVideoCollection.new(uploaded_videos)
      else
        @video_collection
      end
    end

    def available_for_hire?
      @available_for_hire
    end

    def can_work_remotely?
      @can_work_remotely
    end
  end
end
