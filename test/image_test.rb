gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/image'
require_relative '../lib/show_cmd'
require_relative '../lib/clear_cmd'
require_relative '../lib/horizontal_segment_cmd'
require_relative '../lib/vertical_segment_cmd'
require_relative '../lib/fill_region_cmd'
require_relative '../lib/color_pixel_cmd'
require_relative '../lib/exit_cmd'


class RubyTest < Minitest::Test
  def test_create_image
    # skip
    excepted = Image.new(5,6)
    
    assert_instance_of Image, excepted
  end

  def test_show_image
    # skip
    img = Image.new(5,6).execute
    show = ShowCmd.new(image: img)
    assert_output(/^O{5}${6}/) { show.execute }
  end

  def test_color_pixel
    # skip
    img = Image.new(5,6).execute
    result_img = ColorPixelCmd.new(x: 2, y: 3, c: "A", image: img).execute
    
    assert_equal "A", result_img.get_color(1,2)
  end

  def test_vertical_segment
    # skip
    img = Image.new(5,6).execute
    result_img = VerticalSegmentCmd.new( x: 2 ,y1: 3,y2: 4,c: "W" ,image: img).execute
    
    expected = [["O","O","O","O","O"],["O","O","O","O","O"],["O","W","O","O","O"],["O","W","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]

    assert_equal expected, result_img.print_image  
  end

  def test_horizontal_segment
    # skip
    img = Image.new(5,6).execute
    result_img = HorizontalSegmentCmd.new( x1: 3,x2: 4,y: 2,c: "Z" ,image: img).execute
    
    expected = [["O","O","O","O","O"],["O","O","Z","Z","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]
    
    assert_equal expected, result_img.print_image        
  end

  def test_fill_region
    # skip
    img = Image.new(5,6).execute
    img.color_pixel(2,1,"A")
    result_img = FillRegionCmd.new(x: 2,y: 2,c: "J",image: img).execute

    expected = [["J","J","J","J","J"],["J","J","J","J","J"],["J","A","J","J","J"],["J","J","J","J","J"],["J","J","J","J","J"],["J","J","J","J","J"]]
    
    assert_equal expected, result_img.print_image        
  end

  def test_clear_image
    # skip
    img = Image.new(5,6).execute
    img.color_pixel(1,2,"A")

    result_img = ClearCmd.new(image: img).execute

    expected = [["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"],["O","O","O","O","O"]]

    assert_equal expected, result_img.print_image
  end
  
end