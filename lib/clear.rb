require_relative 'base'

class ClearCmd < BaseCmd
  attr_accessor :image

  def initialize(image:)
    @image = image
  end

  def execute
    image.img.map do |row|
        row.map!{'O'}
    end
    image.img
  end

end