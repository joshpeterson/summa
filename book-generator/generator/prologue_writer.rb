require_relative "title_parser"

class PrologueWriter
  def self.write(title, content)
    "# #{TitleParser.format_title(title)}\n\n#{content}"
  end
end
