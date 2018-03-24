# frozen_string_literal: true

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
    end_index = question_text.index(/^\n/, start_index + 1)
    question_text[start_index..end_index].tr("\n", ' ').delete('_')
                                         .gsub(/[ ]{2,}/, ' ').strip
  end

  def parse_content(question_text)
    start_index = question_text.index(/\).?\n?/m) + 1
    unless question_has_content(question_text)
      title_start_index = question_text.index(/^  [A-Z][A-Z]/)
      title_end_index = question_text.index(/\n/, title_start_index + 1)
      start_index = title_end_index
    end
    end_index = question_text.index(/^     ____/, start_index + 1)
    question_text[start_index..end_index].tr("\n", ' ')
                                         .gsub('    ', ' ').gsub('  (', "\n(")
                                         .strip
  end

  def parse_articles(question_text)
    articles = []
    article_index = question_text.index(/___\n\n    Whether/)
    until article_index.nil?
      start_index = question_text.index(/^    Whether/, article_index)
      end_index = question_text.index(/^     ____/, article_index)
      end_index = question_text.length - 1 if end_index.nil?
      parser = ArticleParser.new(question_text[start_index..end_index])
      articles.push(parser.article)
      article_index = question_text.index(/___\n\n    Whether/,
                                          article_index + 1)
    end

    articles
  end

  def question_has_content(question_text)
    title_start_index = question_text.index(/^  [A-Z][A-Z]/)
    divider_index = question_text.index(/^     ____/, title_start_index + 1)
    empty_line_index = question_text.index(/^\n/, title_start_index + 1)
    divider_index > empty_line_index
  end
end
