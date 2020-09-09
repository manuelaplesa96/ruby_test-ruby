class BaseCmd
   
    def self.execute(**args)
      self.new(**args).execute
    end

    def execute
      raise 'Not implemented!'
    end

    private

    attr_accessor :image

end