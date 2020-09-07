class Image
    attr_accessor :m, :n, :img
    
    def initialize(m=1,n=1)
        if check_dimensions?(m,n)
            @m = m
            @n = n
            @img = Array.new(@n){Array.new(@m,'O')}
        else
            puts "Wrong dimensions"
            return
        end
    end

    def color_pixel(x,y,c)
        @img[x][y] = c
        img
    end

    def get_color(x,y)
        if valid_koordinates?(x,y) 
            img[x][y]
        else
            return nil
        end
    end

    private

    def check_dimensions?(m,n)
        m >= 1 && m <= 250 && n >= 1 && n <= 250
    end 
    
    def valid_koordinates?(x,y)
        x >= 0 && x < n && y >= 0 && y < m
    end
end
