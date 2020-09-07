require_relative 'base'

class ShowCmd < BaseCmd
    attr_accessor :image

    def initialize(image)
        @image = image
    end

    def execute
        image[:image].img.each do |row|
            puts row.each { |col| col }.join("")
        end
    end

end