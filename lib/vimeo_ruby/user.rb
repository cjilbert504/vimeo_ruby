module VimeoRuby
  class User < Base
    attr_accessor :video_collection

    def initialize(access_token: nil, attrs: {}, video_collection: VideoCollection.new)
      @video_collection = video_collection
      attrs.each do |key, val|
        instance_variable_set("@#{key}", val)
        unless self.class.method_defined?(key)
          self.class.define_method key do
            instance_variable_get("@#{key}")
          end
        end
      end
      super(access_token: access_token, vimeo_id: uri)
    end

    class << self
      def get_user(access_token: nil)
        user_info = get("#{base_uri}/me", access_token: access_token)
        new(access_token: access_token, attrs: user_info)
      end
    end

    def available_for_hire?
      available_for_hire
    end

    def base_uri
      self.class.base_uri
    end

    def can_work_remotely?
      can_work_remotely
    end

    def video_feed(query_params: {})
      retrieve_video_collection(:feed, query_params)
    end

    def uploaded_videos(query_params: {})
      if video_collection.empty? || !query_params.empty?
        @video_collection = retrieve_video_collection(:videos, query_params)
      else
        video_collection
      end
    end

    private

    def retrieve_video_collection(collection_source, query_params)
      uploaded_videos_response = self.class.get("#{base_uri}/me/#{collection_source}", query_params: query_params, access_token: access_token)
      uploaded_videos = uploaded_videos_response["data"]
      VideoCollection.new(uploaded_videos)
    end
  end
end
