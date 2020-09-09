require_relative 'base_cmd'

class ClearCmd < BaseCmd

  def initialize(image:)
    self.image = image
  end

  def execute
    clear_image
    image
  end

  private

  def clear_image
    ## trenutno execute radi to sto je potrebno, pa mogu ovako dok ne promjenim samu klasu Image
    image.execute
  end

end