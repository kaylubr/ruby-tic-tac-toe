class Cell
  attr_accessor :mark

  def initialize(mark)
    @mark = mark
  end

  def to_s
    self.mark
  end
end