# The editor supports 7 commands:
#   1. I M N. Create a new M x N image with all pixels coloured white (O).
#   2. C. Clears the table, setting all pixels to white (O).
#   3. L X Y C. Colours the pixel (X,Y) with colour C.
#   4. V X Y1 Y2 C. Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
#   5. H X1 X2 Y C. Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
#   6. F X Y C. Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
#   7. S. Show the contents of the current image
#   8. X. Terminate the session





class Image
    attr_accessor :m, :n, :img
    
    def initialize(m ,n)
        if check_dimensions?(m,n)
            @m = m
            @n = n
            @img = Array.new(@n){Array.new(@m,'O')}
        else
            puts "Wrong dimensions"
            return
        end
    end

    def show
        img.each do |row|
            puts row.each { |col| col }.join("")
        end
    end

    def clear
        @img.map do |row|
            row.map!{'O'}
        end
    end

    def color_pixel(x,y,c)
        if valid_koordinates?(x,y)
            @img[x][y] = c
        else
            puts "Invalid koordinates"
            return
        end
    end

    def vertical_segment(x,y1,y2,c)
        for i in y1..y2
            color_pixel(i,x,c)
        end
    end

    def horizontal_segment(x1,x2,y,c)
        for i in x1..x2
            color_pixel(y,i,c)
        end
    end

    def fill_region(x,y,c)        
        current_color = get_color(x,y)
        color_pixel(x,y,c)
                
        return if !current_color
        
        fill_region(x,y-1,c) if get_color(x,y-1) == current_color 
        fill_region(x,y+1,c) if get_color(x,y+1) == current_color
        fill_region(x-1,y,c) if get_color(x-1,y) == current_color 
        fill_region(x+1,y,c) if get_color(x+1,y) == current_color 
        
    end

    private

    def check_dimensions?(m,n)
        m >= 1 && m <= 250 && n >= 1 && n <= 250
    end

    def valid_koordinates?(x,y)
        x >= 0 && x < n && y >= 0 && y < m
    end

    def get_color(x,y)
        if valid_koordinates?(x,y) 
            img[x][y]
        else
            return nil
        end
    end

end

## -------------------

state = true

while state
    command = gets.chomp.split(" ")
    case command[0]
    when 'X'
        state = false
    when 'I'
        img = Image.new(command[1].to_i,command[2].to_i)
    when 'C'
        img.clear
    when 'L'
        img.color_pixel(command[2].to_i-1,command[1].to_i-1,command[3])
    when 'V'
        img.vertical_segment(command[1].to_i-1,command[2].to_i-1,command[3].to_i-1,command[4])
    when 'H'
        img.horizontal_segment(command[1].to_i-1,command[2].to_i-1,command[3].to_i-1,command[4])
    when 'F'
        img.fill_region(command[2].to_i-1,command[1].to_i-1,command[3])  
    when 'S'
        img.show
    end
end





