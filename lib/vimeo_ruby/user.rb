module VimeoRuby
  class User < Base
    attr_reader :video_collection, :available_for_hire, :bio, :can_work_remotely, :location, :name, :profile_link

    def initialize(attrs: {})
      @available_for_hire = attrs.delete("available_for_hire")
      @bio = attrs.delete("bio")
      @can_work_remotely = attrs.delete("can_work_remotely")
      @location = attrs.delete("location")
      @name = attrs.delete("name")
      @profile_link = attrs.delete("link")
      @video_collection = nil
      vimeo_uri_with_id = attrs.delete("uri")
      super(vimeo_uri_with_id, attrs)
    end

    class << self
      def get_user(user_id)
        user_info = get("#{base_uri}/users/#{user_id}")
        new(attrs: user_info)
      end
    end

    def base_uri
      self.class.base_uri
    end

    def uploaded_videos(query_params: {})
      if @video_collection.nil? || !query_params.empty?
        @video_collection = retrieve_video_collection(query_params)
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

    private

    def retrieve_video_collection(query_params)
      uploaded_videos_response = self.class.get("#{base_uri}/users/#{vimeo_id}/videos", query_params: query_params)
      uploaded_videos = uploaded_videos_response["data"]
      UploadedVideoCollection.new(uploaded_videos)
    end
  end
end
