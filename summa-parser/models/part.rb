class Part
  def initialize(title, prologue, treatises)
    @title = title
    @prologue = prologue
    @treatises = treatises
  end

  attr_reader :title
  attr_reader :prologue
  attr_reader :treatises
end