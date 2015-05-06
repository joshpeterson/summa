require_relative '../models/question'
require_relative 'article_parser'

class QuestionParser
	def initialize(question_text)
		@question = parse question_text
	end

	attr_reader :question

	private

	def parse(question_text)
		title = parse_title question_text
		content = parse_content question_text
		articles = parse_articles question_text
		Question.new title, content, articles
	end

	def parse_title(question_text)
		start_index = question_text.index /^  [A-Z]/
		end_index = question_text.index /^\n/, start_index+1
		return question_text[start_index..end_index].gsub("\n", " ").gsub("    ", " ").strip
	end

	def parse_content(question_text)
		start_index = question_text.index(/\)$/) + 1
		end_index = question_text.index /^     ____/, start_index+1
		return question_text[start_index..end_index].gsub("\n", " ").gsub("    ", " ").gsub("  (", "\n(").strip
	end

	def parse_articles(question_text)
		articles = Array.new
		article_index = question_text.index /___\n\n    Whether/
		while article_index != nil do
			start_index = question_text.index /^    Whether/, article_index
			end_index = question_text.index /^     ____/, article_index
			parser = ArticleParser.new question_text[start_index..end_index]
			articles.push parser.article
			article_index = question_text.index /___\n\n    Whether/, article_index + 1
		end

		return articles
	end
end
