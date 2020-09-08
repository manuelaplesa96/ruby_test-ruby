class CommandFactory
  attr_accessor :command
  @@obj = nil

  def initialize(command:)
    self.command = command
  end

  def create
    case command[0]
    when 'X'
      exit!
    when 'I'
      @@obj = Image.new(command[1],command[2])
      return @@obj
    when 'C'
      return ClearCmd.new(image: @@obj)
    when 'L'
      return ColorPixelCmd.new(x: command[2],y: command[1],c: command[3], image: @@obj)
    when 'V'
      return VerticalSegmentCmd.new(x: command[1], y1: command[2], y2: command[3], c: command[4], image: @@obj)
    when 'H'
      return HorizontalSegmentCmd.new(x1: command[1], x2: command[2], y: command[3], c: command[4], image: @@obj) 
    when 'F'
      return FillRegionCmd.new(x: command[2], y: command[1], c: command[3], image: @@obj)
    when 'S'
      return ShowCmd.new(image: @@obj)
    end  
  end

end