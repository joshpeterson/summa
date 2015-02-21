require_relative '../models/article'
require_relative '../models/objection'

class ArticleParser
	def initialize(article_text)
		@article = parse article_text
	end

	attr_reader :article

	private

	def parse(article_text)
		title = parse_title article_text
		contrary = parse_contrary article_text
		answer = parse_answer article_text
		objections = parse_objections article_text
		Article.new title, contrary, answer, objections
	end

	def parse_title(article_text)
		parse_section(article_text, "Whether").gsub "  ", " "
	end

	def parse_contrary(article_text)
		parse_section article_text, "On the contrary, "
	end

	def parse_answer(article_text)
		parse_section article_text, "I answer that, "
	end

	def parse_objections(article_text)
		number_of_objections = article_text.scan(/^\s*Objection \d: /).size
		objections = Array.new number_of_objections
		for i in 1..number_of_objections
			statement = parse_section article_text, "Objection #{i}: "
			reply = parse_section article_text, "Reply to Objection #{i}: "
			objections[i-1] = Objection.new statement, reply
		end
		return objections
	end

	def parse_section(article_text, tag)
		startIndex = article_text.index /^\s*#{tag}/
		if startIndex == nil
			return nil
		end
		endIndex = article_text.index /^\n/, startIndex+1
		if endIndex == nil
			endIndex = article_text.size - 1
		end
		return article_text[startIndex..endIndex].gsub("\n", " ").gsub("    ", " ").strip
	end
end