class Image
  
  def initialize(m=1,n=1)
    m, n = make_coordinates(m,n)
    raise 'Wrong dimensions' unless valid_dimensions?(m+1,n+1)
    self.m = m+1; self.n = n+1
  end

  def execute
    self.canvas = Array.new(n){Array.new(m,'O')}
    self
  end
  
  def color_pixel(x,y,c)
    self.canvas[x][y] = c if valid_coordinates?(x,y)
    canvas
  end

  def get_color(x,y)
    return nil unless valid_coordinates?(x,y)    
    canvas[x][y]
  end

  def make_coordinates(a=0,b=0,c=0)
    [coordinate(a),coordinate(b),coordinate(c)]
  end

  def print_image
    canvas
  end

  private

  attr_accessor :canvas, :n, :m

  def valid_dimensions?(m,n)
    m >= 1 && m <= 250 && n >= 1 && n <= 250
  end 
  
  def valid_coordinates?(x,y)
    x >= 0 && x < n && y >= 0 && y < m
  end

  def coordinate(coord)
    coord.to_i-1
  end

end
