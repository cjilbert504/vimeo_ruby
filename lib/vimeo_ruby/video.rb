module VimeoRuby
  class Video < Base
    attr_reader :description, :duration, :embed_html, :link, :name, :player_embed_url, :type, :user

    def initialize(attrs: {}, user_class: VimeoRuby::User)
      @description = attrs.delete("description")
      @duration = attrs.delete("duration")
      @embed_html = attrs.delete("embed").delete("html")
      @link = attrs.delete("link")
      @name = attrs.delete("name")
      @player_embed_url = attrs.delete("player_embed_url")
      @type = attrs.delete("type")
      @user = user_class.new(attrs: attrs.delete("user"))
      vimeo_uri_with_id = attrs.delete("uri")
      super(vimeo_uri_with_id, attrs)
    end

    class << self
      def get_video(video_id)
        video_info = get("#{base_uri}/videos/#{video_id}")
        new(attrs: video_info)
      end
    end
  end
end
