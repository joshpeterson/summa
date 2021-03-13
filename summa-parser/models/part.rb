# frozen_string_literal: true

class PartParsed
  def initialize(title, prologue, treatises)
    @title = title
    @prologue = prologue
    @treatises = treatises
  end

  attr_reader :title, :prologue, :treatises
end
