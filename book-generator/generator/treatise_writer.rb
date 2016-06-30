require_relative "../../summa-parser/models/treatise"
require_relative "title_parser"

class TreatiseWriter
  def self.write(treatise)
    text = "## #{TitleParser.format_title(treatise.title)}\n\n"
    if not treatise.prologue.nil?
      text += "#{treatise.prologue}\n\n"
    end
    for question in treatise.questions
      text += "* #{TitleParser.format_title(question.title)}\n"
    end

    return text.strip
  end
end
