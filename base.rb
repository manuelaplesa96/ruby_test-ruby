class BaseCmd
    attr_accessor :image

    def self.execute(**args)
      self.new(**args).execute
    end

    def execute
      raise 'Not implemented!'
    end
end