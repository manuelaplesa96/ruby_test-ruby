require_relative 'base'

class FillRegionCmd < BaseCmd
    attr_accessor :x,:y,:c,:image

    def initialize(x:,y:,c:,image:)
        @x = x
        @y = y
        @c = c
        @image = image
    end

    def execute
      fill_region(x,y,c)
       image.img
    end

    private

    def fill_region(x,y,c)        
        current_color = image.get_color(x,y)
        
        image.color_pixel(x,y,c)
                
        return if !current_color
        
        fill_region(x,y-1,c) if image.get_color(x,y-1) == current_color 
        fill_region(x,y+1,c) if image.get_color(x,y+1) == current_color
        fill_region(x-1,y,c) if image.get_color(x-1,y) == current_color 
        fill_region(x+1,y,c) if image.get_color(x+1,y) == current_color 
        
    end

    # def valid_koordinates?(x,y)
    #     x >= 0 && x < image.n && y >= 0 && y < image.m
    # end
end