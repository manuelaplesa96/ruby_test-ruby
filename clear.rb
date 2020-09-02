require_relative 'base'

class ClearCmd < BaseCmd

    def initialize(image)
        @image = image
    end

    def execute
        image[:image].img.map do |row|
            row.map!{'O'}
        end
        image
    end

end