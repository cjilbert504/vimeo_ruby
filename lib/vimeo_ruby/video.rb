module VimeoRuby
  class Video < Base

    def initialize(attrs: {}, user_class: VimeoRuby::User)
      attrs.each do |key, val|
        val = key.eql?("user") ? user_class.new(attrs: val) : val
        val = key.eql?("embed") ? val["html"] : val
        instance_variable_set("@#{key}", val)
        unless self.class.method_defined?(key)
          self.class.define_method key do
            instance_variable_get("@#{key}")
          end
        end
      end

      vimeo_uri_with_id = uri || clip["uri"]
      super(vimeo_id: vimeo_uri_with_id)
    end

    class << self
      def get_video(video_id)
        video_info = get("#{base_uri}/videos/#{video_id}")
        new(attrs: video_info)
      end
    end
  end
end
