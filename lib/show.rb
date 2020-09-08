require_relative 'base'

class ShowCmd < BaseCmd
    attr_accessor :image

    def initialize(image)
        self.image = image
    end

    def execute
        show_image
    end

    private

    def show_image
        image[:image].img.each do |row|
            puts row.each { |col| col }.join("")
        end
    end

end