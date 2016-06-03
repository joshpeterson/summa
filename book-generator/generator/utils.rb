class Utils
  def self.append_prologue_link(path)
    return append_to_path(path_from_stack(path), "prologue.md")
  end

  def self.emit_article_markdown_filename(title)
    return "#{make_string_for_path(title)}.md"
  end

  def self.path_from_stack(stack)
    path = ""
    for entry in stack
      path += "#{make_string_for_path(entry)}/"
    end
    return path.chomp("/")
  end

  private

  def self.append_to_path(path, toAppend)
    "#{path}/#{toAppend}"
  end

  def self.make_string_for_path(value)
    return "#{value.gsub(/\s+/, "_").gsub(/[[:punct:]]?$/, "").downcase}"
  end
end
