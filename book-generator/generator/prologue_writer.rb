require_relative "title_parser"

class PrologueWriter
  def write_prologue(title, content)
    "# #{TitleParser.format_title(title)}\n\n#{content}"
  end
end
