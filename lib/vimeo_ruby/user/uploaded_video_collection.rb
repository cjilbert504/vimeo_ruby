module VimeoRuby
  class User < Base
    class UploadedVideoCollection
      attr_reader :videos

      def initialize(videos_array)
        @videos = videos_array.map do |video_data|
          Video.new(attrs: video_data)
        end
      end
    end
  end
end
