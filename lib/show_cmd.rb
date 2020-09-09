require_relative 'base_cmd'

class ShowCmd < BaseCmd

  def initialize(image:)
    self.image = image
  end

  def execute
    show_image
    image
  end

  private

  def show_image
    image.print_image.each do |row|
      puts row.each { |col| col }.join("")
    end
  end

end