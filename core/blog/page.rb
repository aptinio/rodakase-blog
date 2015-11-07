module Blog
  class Page
    attr_reader :config

    def initialize(config)
      @config = config
    end
  end
end
