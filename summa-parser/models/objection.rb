class ObjectionParsed
  def initialize(statement, reply)
    @statement = statement
    @reply = reply
  end

  attr_reader :statement
  attr_reader :reply
end
