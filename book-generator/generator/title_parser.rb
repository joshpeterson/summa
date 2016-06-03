class TitleParser
  def self.strip_parantheses(title)
    # 1. Replace anything in parantheses with nothing
    # 2. Replace anything in square brackets with nothing
    # 3. Replace two or more adjacent spaces with one space
    title.gsub(/\(.*?\)/, "").gsub(/\[.*?\]/, "").gsub(/\s{2,}/, " ").strip()
  end

  def self.title_casing_for(title)
    title.split.map(&:capitalize).join(" ").gsub(/"([a-z])/){ '"' + $1.upcase }
  end

  def self.strip_asterisk(title)
    title.gsub("*", "")
  end

  def self.format_title(title)
    title_casing_for(strip_asterisk(strip_parantheses(title)))
  end
end
