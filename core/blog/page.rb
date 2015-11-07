module Blog
  # This is our main layout context that we inject into view
  #
  # Methods available in this object will be available in the main layout
  class Page
    attr_reader :config

    def initialize(config)
      @config = config
    end
  end
end
