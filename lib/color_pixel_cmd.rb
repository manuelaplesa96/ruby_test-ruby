require_relative 'base_cmd'

class ColorPixelCmd < BaseCmd
  
  def initialize(x:,y:,c:,image:)
    self.x, self.y = image.make_coordinates(x, y)
    self.c = c
    self.image = image
  end

  def execute
    image.color_pixel(x,y,c)
    image
  end

  private

  attr_accessor :x, :y, :c

end