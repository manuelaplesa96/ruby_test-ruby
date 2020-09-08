# The editor supports 7 commands:
#   1. I M N. Create a new M x N image with all pixels coloured white (O).
#   2. C. Clears the table, setting all pixels to white (O).
#   3. L X Y C. Colours the pixel (X,Y) with colour C.
#   4. V X Y1 Y2 C. Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
#   5. H X1 X2 Y C. Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
#   6. F X Y C. Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. 
#   Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
#   7. S. Show the contents of the current image
#   8. X. Terminate the session


require_relative 'command_factory'
require_relative 'image'
require_relative 'show'
require_relative 'clear'
require_relative 'vertical_segment'
require_relative 'horizontal_segment'
require_relative 'fill_region'
require_relative 'color_pixel'

state = true  
image = Image.new()

while state
  command = CommandFactory.new(command: gets.chomp.split(" ")).create(image)
  # p command
  image = command.execute
  # p image
end





