require_relative '../models/summa'

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
	end
end