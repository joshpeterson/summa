class Utils
  def self.append_prologue_link(path)
    return append_to_path(path_from_stack(path), "prologue.md")
  end

  def self.emit_markdown_filename(title)
    return "#{make_string_for_path(title)}.md"
  end

  def self.path_from_stack(stack)
    path = ""
    for entry in stack
      path += "#{make_string_for_path(entry)}/"
    end
    return path.chomp("/")
  end

  def self.sanitize(title)
    # 1. Replace anything in parantheses with nothing
    # 2. Replace anything in square brackets with nothing
    # 3. Replace an asterisk with nothing
    # 4. Replace a period with nothing
    # 5. Replace curly braces with nothing
    # 6. Replace remaining square brackets with nothing
    # 7. Replace double quotes with nothing
    # 8. Replace single quotes with nothing
    # 9. Replace any number of consecutive dashes with nothing
    # 10. Replace a colon with nothing
    # 10. Replace a comma with nothing
    # 11. Replace punctuation with nothing
    # 12. Replace two or more adjacent spaces with one space
    # 13. Replace whitespace with an underscore
    title.gsub(/\(.*?\)/, "").gsub(/\[.*?\]/, "").gsub("*", "").gsub(".", "")
      .gsub("{", "").gsub("}", "").gsub("[", "").gsub("]", "").gsub("\"","")
      .gsub("'","").gsub(/-+?/, "").gsub(":", "").gsub(/,/,"")
      .gsub(/[[:punct:]]?$/, "").gsub(/\s{2,}/, " ").strip().gsub(/\s+/, "_")
  end

  private

  def self.append_to_path(path, toAppend)
    "#{path}/#{toAppend}"
  end

  def self.make_string_for_path(value)
    return "#{sanitize(value).downcase}"
  end
end
