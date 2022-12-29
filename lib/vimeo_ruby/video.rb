module VimeoRuby
  class Video < Base
    attr_reader :vimeo_id, :description, :duration, :embed_html, :link, :name, :player_embed_url, :type, :user, :additional_info

    def initialize(attrs: {}, user_class: VimeoRuby::User)
      @vimeo_id = extract_vimeo_id_from_uri(attrs.delete("uri"))
      @description = attrs.delete("description")
      @duration = attrs.delete("duration")
      @embed_html = attrs.delete("embed").delete("html")
      @link = attrs.delete("link")
      @name = attrs.delete("name")
      @player_embed_url = attrs.delete("player_embed_url")
      @type = attrs.delete("type")
      @user = user_class.new(attrs: attrs.delete("user"))
      @additional_info = OpenStruct.new(attrs)
    end

    def self.get_video(video_id)
      video_info = get("#{base_uri}/videos/#{video_id}")
      new(attrs: video_info)
    end
  end
end
