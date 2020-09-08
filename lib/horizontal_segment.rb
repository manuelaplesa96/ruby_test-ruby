require_relative 'base'

class HorizontalSegmentCmd < BaseCmd
  attr_accessor :x1,:x2,:y,:c,:image

  def initialize(x1:,x2:,y:,c:,image:)
    self.x1 = x1; self.x2 = x2; self.y = y
    self.c = c
    self.image = image
  end

  def execute
    horizontal_segment_image
    image
  end

  private

  def horizontal_segment_image
    for i in x1..x2
      image.color_pixel(y,i,c)
    end
  end
end