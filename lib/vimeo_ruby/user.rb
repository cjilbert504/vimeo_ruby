module VimeoRuby
  class User < VimeoRuby::Base
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def self.find(id)
      get("#{base_uri}/users/#{id}")
    end
  end
end
