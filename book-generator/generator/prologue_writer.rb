require_relative "title_parser"

class PrologueWriter
  def self.write(title, content, entries)
    prologue = "# #{TitleParser.format_title(title)}\n\n"
    if not content.to_s.empty?
      prologue += "#{content}\n\n"
    end

    for entry in entries
      prologue += "* #{TitleParser.format_title(entry.title)}\n"
    end

    return prologue.strip
  end
end
