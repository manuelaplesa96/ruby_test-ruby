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

    def color_pixel(x,y,c)
        @img[x][y] = c
    end

    private

    def check_dimensions?(m,n)
        m >= 1 && m <= 250 && n >= 1 && n <= 250
    end

end
