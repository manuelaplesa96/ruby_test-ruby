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


# class Command
#     attr_reader :command

#     def initialize(command)
#         @command = command
#     end

#     def execute(command)
#         case command
#         when 'X'
#             state = false
#         when 'I'
#             img = Image.new(command[1].to_i,command[2].to_i)
#         when 'C'
#             ClearCmd.execute(image: img)
#         when 'L'
#             img.color_pixel(command[2].to_i-1,command[1].to_i-1,command[3])
#         when 'V'
#             img = VerticalSegmentCmd.execute( x: (command[1].to_i-1),
#                                         y1: (command[2].to_i-1),
#                                         y2: (command[3].to_i-1),
#                                         c: command[4],
#                                         image: img )
#         when 'H'
#             img = HorizontalSegmentCmd.execute(   x1: command[1].to_i-1,
#                                             x2: command[2].to_i-1,
#                                             y: command[3].to_i-1,
#                                             c: command[4],
#                                             image: img ) 
#         when 'F'
#             img = FillRegionCmd.execute(  x: command[2].to_i-1,
#                                     y: command[1].to_i-1,
#                                     c: command[3],
#                                     image: img)
#         when 'S'
#             ShowCmd.execute(image: img)
#         end 
#     end
# end

state = true

while state
    command = gets.chomp.split(" ")
    case command[0]
    when 'X'
        state = false
    when 'I'
        img = Image.new(command[1].to_i,command[2].to_i)
    when 'C'
        img.img = ClearCmd.execute(image: img)
    when 'L'
        img.color_pixel(command[2].to_i-1,command[1].to_i-1,command[3])
    when 'V'
        img.img = VerticalSegmentCmd.execute( x: (command[1].to_i-1),
                                    y1: (command[2].to_i-1),
                                    y2: (command[3].to_i-1),
                                    c: command[4],
                                    image: img )
    when 'H'
        img.img = HorizontalSegmentCmd.execute(   x1: command[1].to_i-1,
                                        x2: command[2].to_i-1,
                                        y: command[3].to_i-1,
                                        c: command[4],
                                        image: img ) 
    when 'F'
        img.img = FillRegionCmd.execute(  x: command[2].to_i-1,
                                y: command[1].to_i-1,
                                c: command[3],
                                image: img)
    when 'S'
        ShowCmd.execute(image: img)
    end
end





