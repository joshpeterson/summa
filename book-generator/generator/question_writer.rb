require_relative "title_parser"

class QuestionWriter
  def self.write(title, content)
    question = "## #{TitleParser.format_title(title)}\n\n"
    if not content.to_s.empty?
      question += "#{content}\n\n"
    end

    return question.strip
  end
end
