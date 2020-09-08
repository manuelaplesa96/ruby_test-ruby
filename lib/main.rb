# The editor supports 7 commands:
#   1. I M N. Create a new M x N image with all pixels coloured white (O).
#   2. C. Clears the table, setting all pixels to white (O).
#   3. L X Y C. Colours the pixel (X,Y) with colour C.
#   4. V X Y1 Y2 C. Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
#   5. H X1 X2 Y C. Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
#   6. F X Y C. Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
#   7. S. Show the contents of the current image
#   8. X. Terminate the session


require_relative 'image'
require_relative 'show'
require_relative 'clear'
require_relative 'vertical_segment'
require_relative 'horizontal_segment'
require_relative 'fill_region'


class CommandFactory
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def execute(obj)
    state = true
    case command[0]
    when 'X'
      state = false
    when 'I'
      obj = Image.new(command[1].to_i,command[2].to_i)
    when 'C'
      obj = ClearCmd.execute(image: obj)
    when 'L'
      x, y = obj.make_vaild_coordinate(command[2], command[1])
      obj.color_pixel(y,x,command[3])
    when 'V'
      x, y1, y2 = obj.make_vaild_coordinate(command[1], command[2], command[3])
      obj = VerticalSegmentCmd.execute( x: x, y1: y1, y2: y2, c: command[4], image: obj )
    when 'H'
      x1, x2, y = obj.make_vaild_coordinate(command[1], command[2], command[3])
      obj = HorizontalSegmentCmd.execute(   x1: x1, x2: x2, y: y, c: command[4], image: obj ) 
    when 'F'
      x, y = obj.make_vaild_coordinate(command[2], command[1])
      obj = FillRegionCmd.execute(x: x, y: y, c: command[3], image: obj)
    when 'S'
      ShowCmd.execute(image: obj)
    end
    [obj,state] 
  end
  
end

#------------------------#

state = true  
image = Image.new()

while state
  command = CommandFactory.new(gets.chomp.split(" "))
  image,state = command.execute(image)
end





