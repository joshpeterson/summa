require_relative '../models/summa'
require_relative 'article_parser'

class SummaParser
	def initialize(summa_text)
		@summa = parse summa_text
	end

	attr_reader :summa

	private

	def parse(summa_text)
		articles = parse_articles summa_text
		Summa.new articles
	end

	def parse_articles(summa_text)
		articles = Array.new
		article_index = summa_text.index /___\n\n    Whether/
		while article_index != nil do
			start_index = summa_text.index /^    Whether/, article_index
			end_index = summa_text.index /^     ____/, article_index
			parser = ArticleParser.new summa_text[start_index..end_index]
			articles.push parser.article
			article_index = summa_text.index /___\n\n    Whether/, article_index + 1
		end

		return articles
	end
end