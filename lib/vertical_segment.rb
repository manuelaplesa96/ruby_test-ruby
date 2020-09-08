require_relative 'base'

class VerticalSegmentCmd < BaseCmd
  attr_accessor :x,:y1,:y2,:c,:image

  def initialize(x:,y1:,y2:,c:,image:)
    @x = x
    @y1 = y1
    @y2 = y2
    @c = c
    @image = image
  end

  def execute
    for i in y1..y2
      image.color_pixel(i,x,c)
    end
    image
  end
end