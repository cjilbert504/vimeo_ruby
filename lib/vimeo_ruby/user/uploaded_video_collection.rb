module VimeoRuby
  class User < VimeoRuby::Base
    class UploadedVideoCollection
      attr_reader :list

      def initialize(videos_array)
        @list = videos_array
      end
    end
  end
end
