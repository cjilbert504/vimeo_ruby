module VimeoRuby
  class User < Base
    attr_reader :available_for_hire, :bio, :can_work_remotely, :location, :name, :profile_link, :video_collection

    def initialize(access_token: nil, attrs: {})
      @available_for_hire = attrs.delete("available_for_hire")
      @bio = attrs.delete("bio")
      @can_work_remotely = attrs.delete("can_work_remotely")
      @location = attrs.delete("location")
      @name = attrs.delete("name")
      @profile_link = attrs.delete("link")
      @video_collection = nil

      vimeo_uri_with_id = attrs.delete("uri")
      super(access_token: access_token, vimeo_id: vimeo_uri_with_id, remaining_attrs: attrs)
    end

    class << self
      def get_user(access_token: nil)
        user_info = get("#{base_uri}/me", access_token: access_token)
        new(access_token: access_token, attrs: user_info)
      end
    end

    def available_for_hire?
      @available_for_hire
    end

    def base_uri
      self.class.base_uri
    end

    def can_work_remotely?
      @can_work_remotely
    end

    def video_feed(query_params: {})
      video_feed_response = self.class.get("#{base_uri}/me/feed", query_params: query_params, access_token: access_token)
      video_feed = video_feed_response["data"]
      VideoCollection.new(video_feed)
    end

    def uploaded_videos(query_params: {})
      if @video_collection.nil? || !query_params.empty?
        @video_collection = retrieve_video_collection(query_params)
      else
        @video_collection
      end
    end

    private

    def retrieve_video_collection(query_params)
      uploaded_videos_response = self.class.get("#{base_uri}/me/videos", query_params: query_params, access_token: access_token)

      uploaded_videos = uploaded_videos_response["data"]
      VideoCollection.new(uploaded_videos)
    end
  end
end
