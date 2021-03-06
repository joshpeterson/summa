# frozen_string_literal: true

module TitleParser
  extend ActiveSupport::Concern

  def strip_parantheses(title)
    # 1. Replace anything in parantheses with nothing
    # 2. Replace anything in square brackets with nothing
    # 3. Replace two or more adjacent spaces with one space
    title.gsub(/\(.*?\)/, '').gsub(/\[.*?\]/, '').gsub(/\s{2,}/, ' ').strip
  end

  def title_casing_for(title)
    title.titleize
  end

  def strip_asterisk(title)
    title.delete('*')
  end

  def format_title(title)
    title_casing_for(strip_asterisk(strip_parantheses(title)))
  end
end
