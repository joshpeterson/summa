require_relative "title_parser"

class PrologueWriter
  def self.write(title, content)
    prologue = "# #{TitleParser.format_title(title)}\n\n"
    if not content.to_s.empty?
      prologue += "#{content}\n\n"
    end

    return prologue.strip
  end
end
