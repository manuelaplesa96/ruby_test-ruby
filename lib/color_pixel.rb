require_relative 'base'

class ColorPixelCmd < BaseCmd
  attr_accessor :image, :x, :y, :c

  def initialize(x:,y:,c:,image:)
    self.x, self.y = image.make_coordinates(x, y)
    self.c = c
    self.image = image
  end

  def execute
    image.color_pixel(x,y,c)
    image
  end

end