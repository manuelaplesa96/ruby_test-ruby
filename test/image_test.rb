gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/image'
require_relative '../lib/show'
require_relative '../lib/clear'
require_relative '../lib/horizontal_segment'
require_relative '../lib/vertical_segment'
require_relative '../lib/fill_region'

class RubyTest < Minitest::Test
  def test_create_image
    excepted = Image.new(5,6)
    
    assert_instance_of Image, excepted
  end

  def test_show_image
    # skip
    excepted = Array.new(6){Array.new(5,'O')}

    assert_equal excepted, ShowCmd.execute(image: Image.new(5,6))
  end

  def test_color_pixel
    img = Image.new(5,6)
    img.color_pixel(1,2,"A")
    
    assert_equal "A", img.get_color(1,2)
  end

  def test_vertical_segment
    img = Image.new(5,6)
    result_img = VerticalSegmentCmd.execute( x: 1 ,y1: 2,y2: 3,c: "W" ,image: img)
    
    expected = [["O","O","O","O","O"],["O","O","O","O","O"],["O","W","O","O","O"],["O","W","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]
    
    assert_equal expected, result_img   
  end

  def test_horizontal_segment
    img = Image.new(5,6)
    result_img = HorizontalSegmentCmd.execute( x1: 2,x2: 3,y: 1,c: "Z" ,image: img)
    
    expected = [["O","O","O","O","O"],["O","O","Z","Z","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]
    
    assert_equal expected, result_img         
  end

  def test_fill_region
    img = Image.new(5,6)
    img.color_pixel(2,1,"A")
    result_img = FillRegionCmd.execute(x: 2,y: 2,c: "J",image: img)

    expected = [["J","J","J","J","J"],["J","J","J","J","J"],["J","A","J","J","J"],["J","J","J","J","J"],["J","J","J","J","J"],["J","J","J","J","J"]]
    
    assert_equal expected, result_img         
  end

  def test_clear_image
    img = Image.new(5,6)
    img.color_pixel(1,2,"A")

    result_img = ClearCmd.execute(image: img)

    expected = [["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]

    assert_equal expected, result_img
  end
  
end