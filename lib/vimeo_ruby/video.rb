module VimeoRuby
  class Video
    attr_reader :uri, :name, :description, :type, :link, :player_embed_url, :duration, :embed_html, :additional_info, :user

    def initialize(attrs: {})
      @uri = attrs.delete("uri")
      @name = attrs.delete("name")
      @description = attrs.delete("description")
      @type = attrs.delete("type")
      @link = attrs.delete("link")
      @player_embed_url = attrs.delete("player_embed_url")
      @duration = attrs.delete("duration")
      @embed_html = attrs.delete("embed").delete("html")
      @user = VimeoRuby::User.new(attrs: attrs.delete("user"))
      @additional_info = attrs
    end
  end
end
