# frozen_string_literal: true

require_relative '../models/article'
require_relative '../models/objection'

class ArticleParser
  def initialize(article_text)
    @article = parse(article_text)
  end

  attr_reader :article

  private

  def parse(article_text)
    title = parse_title(article_text)
    contrary = parse_contrary(article_text)
    answer = parse_answer(article_text)
    objections = parse_objections(article_text)
    ArticleParsed.new(title, contrary, answer, objections)
  end

  def parse_title(article_text)
    title = parse_section(article_text, 'Whether', nil).gsub('  ', ' ')
    title = title.sub(/ \[.*\]/, '')
    title.sub('*', '')
  end

  def parse_contrary(article_text)
    parse_section(article_text, 'On the contrary, ', nil)
  end

  def parse_answer(article_text)
    parse_section(article_text, 'I answer that, ', 'Reply to Objection')
  end

  def parse_objections(article_text)
    number_of_objections = article_text.scan(/^\s*Objection \d: /).size
    objections = Array.new(number_of_objections)
    objections.map!.with_index(1) do |_objection, i|
      statement = parse_section(article_text, "Objection #{i}: ", nil)
      reply = parse_section(article_text, "Reply to Objection #{i}: ", nil)
      ObjectionParsed.new(statement, reply)
    end
  end

  def parse_section(article_text, tag, end_tag)
    start_index = article_text.index(/^\s*#{tag}/)
    return nil if start_index.nil?

    end_index = if end_tag.nil?
                  article_text.index(/^\n/, start_index + 1)
                else
                  article_text.index(/^\s*#{end_tag}/)
                end

    end_index = article_text.size - 1 if end_index.nil?

    # Do the following replacements:
    # 1. Any newline that is not at the beginning with a space
    # 2. Three spaces with one space
    # 3. Two spaces at the start of a line with a new line
    # 4. A space at the end of a line with nothing
    # This should keep empty lines as-is and collapse everything else.
    article_text[start_index..end_index].gsub(/(?!^)\n/, ' ')
                                        .gsub('    ', ' ').gsub(/^   /, "\n")
                                        .gsub(/ $/, '').strip
  end
end
