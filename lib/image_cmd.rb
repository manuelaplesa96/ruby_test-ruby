## Ne koristi se

require_relative 'base_cmd'

class ImageCmd < BaseCmd

  def initialize

  end

  def execute
    Array.new(n){Array.new(m,'O')}
  end

end