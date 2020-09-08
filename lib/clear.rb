require_relative 'base'

class ClearCmd < BaseCmd
  attr_accessor :image

  def initialize(image:)
    self.image = image
  end

  def execute
    clear_image
    image
  end

  private

  def clear_image
    image.img.map do |row|
      row.map!{'O'}
    end
  end

end