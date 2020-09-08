class Image
  attr_accessor :img, :n,:m
  
  def initialize(m=1,n=1)
    if check_dimensions?(m,n)
      @m = m; @n = n
      @img = Array.new(n){Array.new(m,'O')}
    else
      puts "Wrong dimensions"
      return
    end
  end

  def color_pixel(x,y,c)
    if valid_koordinates?(x,y)
      @img[x][y] = c
    end
    img
  end

  def get_color(x,y)
    if valid_koordinates?(x,y)     
      img[x][y]
    else
      return nil
    end
  end

  def make_vaild_coordinate(a=0,b=0,c=0)
    [coordinate(a),coordinate(b),coordinate(c)]
  end

  private

  def check_dimensions?(m,n)
    m >= 1 && m <= 250 && n >= 1 && n <= 250
  end 
  
  def valid_koordinates?(x,y)
    x >= 0 && x < n && y >= 0 && y < m
  end

  def coordinate(coord)
    coord.to_i-1
  end

end
