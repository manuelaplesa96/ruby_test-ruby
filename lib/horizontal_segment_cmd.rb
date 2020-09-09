require_relative 'base_cmd'

class HorizontalSegmentCmd < BaseCmd
  
  def initialize(x1:,x2:,y:,c:,image:)
    self.x1, self.x2, self.y = image.make_coordinates(x1, x2, y)
    self.c = c
    self.image = image
  end

  def execute
    horizontal_segment_image
    image
  end

  private

  attr_accessor :x1,:x2,:y,:c

  def horizontal_segment_image
    for i in x1..x2
      image.color_pixel(y,i,c)
    end
  end
end