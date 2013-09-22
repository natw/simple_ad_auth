module SimpleADAuth
  class User
    attr_accessor :entry

    def initialize(entry)
      @entry = entry
    end

    def groups
      entry[:memberof].map { |e| e.split(',')[0].split('=')[1] }
    end
  end
end
