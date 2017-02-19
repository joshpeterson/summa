require_relative '../../summa-parser/models/article'
require_relative 'title_parser'

class ArticleWriter
  def self.write(article)
    text = "### #{TitleParser.format_title(article.title)}\n\n"
    text += "**Objections**\n\n"
    article.objections.each do |objection|
      text += "#{objection.statement}\n\n"
    end

    text += "**Answer**\n\n"
    text += "#{article.contrary}\n\n"
    text += "#{article.answer}\n\n"

    if article.objections.any? { |o| !o.reply.nil? }
      text += "**Replies**\n\n"
      article.objections.each do |objection|
        text += "#{objection.reply}\n\n" unless objection.reply.nil?
      end
    end

    text.strip
  end
end
