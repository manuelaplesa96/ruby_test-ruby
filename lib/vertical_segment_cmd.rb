require_relative 'base_cmd'

class VerticalSegmentCmd < BaseCmd
 
  def initialize(x:,y1:,y2:,c:,image:)
    self.x, self.y1, self.y2 = image.make_coordinates(x, y1, y2)
    self.c = c
    self.image = image
  end

  def execute
    vertical_segment_image
    image
  end

  private

  attr_accessor :x,:y1,:y2,:c

  def vertical_segment_image
    for i in y1..y2
      image.color_pixel(i,x,c)
    end
  end

end