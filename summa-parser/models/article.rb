# frozen_string_literal: true

class ArticleParsed
  def initialize(title, contrary, answer, objections)
    @title = title
    @contrary = contrary
    @answer = answer
    @objections = objections
  end

  attr_reader :title, :contrary, :answer, :objections
end
