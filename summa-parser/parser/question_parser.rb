require_relative '../models/question'
require_relative 'article_parser'

class QuestionParser
  def initialize(question_text)
    @question = parse(question_text)
  end

  attr_reader :question

  private

  def parse(question_text)
    if question_text.empty?
        raise ArgumentError, "Argument 'question_text' must not be empty."
    end
    title = parse_title(question_text)
    content = parse_content(question_text)
    articles = parse_articles(question_text)
    QuestionParsed.new(title, content, articles)
  end

  def parse_title(question_text)
    start_index = question_text.index(/^  [A-Z][A-Z]/)
    end_index = question_text.index(/^\n/, start_index+1)
    return question_text[start_index..end_index].gsub("\n", " ").gsub("_", "")
            .gsub(/[ ]{2,}/, " ").strip
  end

  def parse_content(question_text)
    start_index = question_text.index(/\).?\n?/m) + 1
    unless question_has_content(question_text)
      title_start_index = question_text.index(/^  [A-Z][A-Z]/)
      title_end_index = question_text.index(/\n/, title_start_index+1)
      start_index = title_end_index
    end
    end_index = question_text.index(/^     ____/, start_index+1)
    return question_text[start_index..end_index].gsub("\n", " ")
            .gsub("    ", " ").gsub("  (", "\n(").strip
  end
  
  def parse_articles(question_text)
    articles = Array.new
    article_index = question_text.index(/___\n\n    Whether/)
    while article_index != nil do
      start_index = question_text.index(/^    Whether/, article_index)
      end_index = question_text.index(/^     ____/, article_index)
      if (end_index == nil)
          end_index = question_text.length - 1
      end
      parser = ArticleParser.new(question_text[start_index..end_index])
      articles.push(parser.article)
      article_index = question_text.index(/___\n\n    Whether/,
                                          article_index + 1)
    end

    return articles
  end
  
  private

  def question_has_content(question_text)
    title_start_index = question_text.index(/^  [A-Z][A-Z]/)
    divider_index = question_text.index(/^     ____/, title_start_index+1)
    empty_line_index = question_text.index(/^\n/, title_start_index+1)
    return divider_index > empty_line_index
  end
end
