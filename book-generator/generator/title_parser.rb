class TitleParser
  def self.sanitize(title)
    # 1. Replace anything in parantheses with nothing
    # 2. Replace anything in square brackets with nothing
    # 3. Replace two or more adjacent spaces with one space
    # 4. Replace an asterisk with nothing
    # 5. Replace a period with nothing
    # 6. Replace curly braces with nothing
    title.gsub(/\(.*?\)/, "").gsub(/\[.*?\]/, "").gsub(/\s{2,}/, " ").
      gsub("*", "").gsub(".", "").gsub("{", "").gsub("}", "").strip()
  end

  def self.title_casing_for(title)
    title.split.map(&:capitalize).join(" ").gsub(/"([a-z])/){ '"' + $1.upcase }
  end

  def self.format_title(title)
    title_casing_for(sanitize(title))
  end
end
