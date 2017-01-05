require_relative '../../summa-parser/models/article'
require_relative 'title_parser'

class ArticleWriter
  def self.write(article)
    text = "### #{TitleParser.format_title(article.title)}\n\n"

    text += "#{article.contrary}\n\n"
    text += "---\n\n"
    text += "#{article.answer}\n\n"

    article.objections.each do |objection|
      text += "---\n\n"
      text += "#{objection.statement}\n\n"
      text += "#{objection.reply}\n\n" unless objection.reply.nil?
    end

    text.strip
  end
end
