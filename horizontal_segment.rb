require_relative 'base'

class HorizontalSegmentCmd < BaseCmd
    attr_accessor :x1,:x2,:y,:c,:image

    def initialize(x1:,x2:,y:,c:,image:)
        @x1 = x1
        @x2 = x2
        @y = y
        @c = c
        @image = image
    end

    def execute
        for i in x1..x2
            image.color_pixel(y,i,c)
        end
        image
    end
end