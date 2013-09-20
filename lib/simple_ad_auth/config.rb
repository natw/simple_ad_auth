module SimpleADAuth
  class Config
    attr_accessor :host,
                  :port,
                  :domain,
                  :search_root

    def initialize
      @port = 389
    end
  end
end
