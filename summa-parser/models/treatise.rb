# frozen_string_literal: true

class TreatiseParsed
  def initialize(title, prologue, questions)
    @title = title
    @prologue = prologue
    @questions = questions
  end

  attr_reader :title
  attr_reader :prologue
  attr_reader :questions
end
