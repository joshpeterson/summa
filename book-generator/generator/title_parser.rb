class TitleParser
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
    # 10. Replace two or more adjacent spaces with one space
    title.gsub(/\(.*?\)/, "").gsub(/\[.*?\]/, "").gsub("*", "").gsub(".", "")
      .gsub("{", "").gsub("}", "").gsub("[", "").gsub("]", "").gsub("\"","")
      .gsub("'","").gsub(/-+?/, "").gsub(/\s{2,}/, " ").strip()
  end

  def self.title_casing_for(title)
    title.split.map(&:capitalize).join(" ").gsub(/"([a-z])/){ '"' + $1.upcase }
  end

  def self.format_title(title)
    title_casing_for(sanitize(title))
  end
end
