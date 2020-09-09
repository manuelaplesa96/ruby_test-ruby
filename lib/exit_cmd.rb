require_relative 'base_cmd'

class ExitCmd < BaseCmd

  def initialize
  end

  def execute
    exit!
  end

end