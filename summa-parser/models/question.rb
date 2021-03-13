# frozen_string_literal: true

class QuestionParsed
  def initialize(title, content, articles)
    @title = title
    @content = content
    @articles = articles
  end

  attr_reader :title, :content, :articles
end
