module VimeoRuby
  class User < Base
    attr_accessor :uploaded_videos, :video_feed

    def initialize(access_token: nil, attrs: {}, video_collection: VideoCollection.new)
      @uploaded_videos = video_collection.dup
      @video_feed = video_collection.dup

      attrs.each do |key, val|
        instance_variable_set("@#{key}", val)
        define_attribute_reader(key)
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

    def can_work_remotely?
      can_work_remotely
    end

    def edit(body_params = {})
      updated_user_details = patch("#{base_uri}/me", access_token: access_token, body_params: body_params)
      reanimate_from(updated_user_details)
    end

    def get_video_feed(query_params: {})
      @video_feed = retrieve_video_collection(:feed, query_params)
    end

    def get_uploaded_videos(query_params: {})
      @uploaded_videos = retrieve_video_collection(:videos, query_params)
    end

    private

    def reanimate_from(user_details)
      updated_user = self.class.new(attrs: user_details)
      updated_user.video_feed = video_feed
      updated_user.uploaded_videos = uploaded_videos
      updated_user
    end

    def retrieve_video_collection(collection_source, query_params)
      video_collection_response = self.class.get("#{base_uri}/me/#{collection_source}",
        query_params: query_params,
        access_token: access_token)

      VideoCollection.new(video_collection_response["data"])
    end
  end
end
