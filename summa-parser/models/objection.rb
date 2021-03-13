# frozen_string_literal: true

class ObjectionParsed
  def initialize(statement, reply)
    @statement = statement
    @reply = reply
  end

  attr_reader :statement, :reply
end
