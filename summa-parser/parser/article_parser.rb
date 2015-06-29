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
    title = parse_section(article_text, "Whether").gsub("  ", " ")
    title = title.sub(/ \[.*\]/, "")
    title.sub("*", "")
  end

  def parse_contrary(article_text)
    parse_section(article_text, "On the contrary, ")
  end

  def parse_answer(article_text)
    parse_section(article_text, "I answer that, ")
  end

  def parse_objections(article_text)
    number_of_objections = article_text.scan(/^\s*Objection \d: /).size
    objections = Array.new(number_of_objections)
    for i in 1..number_of_objections
      statement = parse_section(article_text, "Objection #{i}: ")
      reply = parse_section(article_text, "Reply to Objection #{i}: ")
      objections[i-1] = ObjectionParsed.new(statement, reply)
    end
    return objections
  end

  def parse_section(article_text, tag)
    start_index = article_text.index(/^\s*#{tag}/)
    if start_index == nil
      return nil
    end
    end_index = article_text.index(/^\n/, start_index+1)
    if end_index == nil
      end_index = article_text.size - 1
    end
    return article_text[start_index..end_index].gsub("\n", " ")
            .gsub("    ", " ").strip
  end
end
