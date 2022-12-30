module VimeoRuby
  class User < Base
    class VideoCollection
      attr_reader :videos

      def initialize(videos_array)
        @videos = videos_array.map do |video_data|
          Video.new(attrs: video_data)
        end
      end

      def empty?
        videos.empty?
      end
    end
  end
end
