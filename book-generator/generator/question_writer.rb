# frozen_string_literal: true

require_relative 'title_parser'

class QuestionWriter
  def self.write(title, content)
    question = "## #{TitleParser.format_title(title)}\n\n"
    question += "#{content}\n\n" unless content.to_s.empty?

    question.strip
  end
end
