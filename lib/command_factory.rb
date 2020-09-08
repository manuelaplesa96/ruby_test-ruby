class CommandFactory
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def execute(obj)
    state = true
    case command[0]
    when 'X'
      state = false
    when 'I'
      obj = Image.new(command[1].to_i,command[2].to_i)
    when 'C'
      obj = ClearCmd.execute(image: obj)
    when 'L'
      x, y = obj.make_vaild_coordinate(command[2], command[1])
      obj.color_pixel(x,y,command[3])
    when 'V'
      x, y1, y2 = obj.make_vaild_coordinate(command[1], command[2], command[3])
      obj = VerticalSegmentCmd.execute( x: x, y1: y1, y2: y2, c: command[4], image: obj )
    when 'H'
      x1, x2, y = obj.make_vaild_coordinate(command[1], command[2], command[3])
      obj = HorizontalSegmentCmd.execute(   x1: x1, x2: x2, y: y, c: command[4], image: obj ) 
    when 'F'
      x, y = obj.make_vaild_coordinate(command[2], command[1])
      obj = FillRegionCmd.execute(x: x, y: y, c: command[3], image: obj)
    when 'S'
      ShowCmd.execute(image: obj)
    end
    [obj,state] 
  end
  
end