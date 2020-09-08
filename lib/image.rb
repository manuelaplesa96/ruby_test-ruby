class Image
  attr_accessor :img, :n,:m
  
  def initialize(m=1,n=1)
    raise 'Wrong dimensions' unless valid_dimensions?(m,n)
    self.m = m; self.n = n
    self.img = Array.new(n){Array.new(m,'O')}
  end

  def color_pixel(x,y,c)
    self.img[x][y] = c if valid_coordinates?(x,y)
    img
  end

  def get_color(x,y)
    return nil unless valid_coordinates?(x,y)    
    img[x][y]
  end

  def make_vaild_coordinate(a=0,b=0,c=0)
    [coordinate(a),coordinate(b),coordinate(c)]
  end

  def print_image
    img
  end

  private

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
