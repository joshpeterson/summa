# frozen_string_literal: true

require_relative '../../summa-parser/models/treatise'
require_relative 'title_parser'

class TreatiseWriter
  def self.write(treatise)
    text = "# #{TitleParser.format_title(treatise.title)}\n\n"
    text += "#{treatise.prologue}\n\n" unless treatise.prologue.nil?
    treatise.questions.each do |question|
      text += "* #{TitleParser.format_title(question.title)}\n"
    end

    text.strip
  end
end
