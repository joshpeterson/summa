class TitleParser

  def self.title_casing_for(title)
    title.split.map(&:capitalize).join(" ").gsub(/"([a-z])/){ '"' + $1.upcase }
      .gsub("I.e.", "i.e.")
  end

  def self.format_title(title)
    title_casing_for(sanitize(title))
  end

  private

  def self.sanitize(title)
    # 1. Replace anything in parantheses with nothing
    # 2. Replace anything in square brackets with nothing (across multiple lines)
    # 3. Replace an asterisk with nothing
    # 4. Replace two or more adjacent spaces with one space
    title.gsub(/\(.*?\)/, "").gsub(/\[.*\]/m, "").gsub("*", "").gsub(/\s{2,}/, " ")
      .strip()
  end
end
