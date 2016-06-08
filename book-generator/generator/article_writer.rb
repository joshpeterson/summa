require_relative "../../summa-parser/models/article"
require_relative "title_parser"

class ArticleWriter
  def self.write(article)
    text = "# #{TitleParser.format_title(article.title)}\n"
    text += "## Objections\n"
    article.objections.each_with_index do |objection, i|
      text += "Objection #{i+1}: #{objection.statement}\n"
    end

    text += "## Answer\n"
    text += "On the contrary, #{article.contrary}\n"
    text += "I answer that, #{article.answer}\n"

    if article.objections.any? {|o| !o.reply.nil?}
      text += "## Replies\n"
      article.objections.each_with_index do |objection, i|
        if !objection.reply.nil?
          text += "Reply #{i+1}: #{objection.reply}\n"
        end
      end
    end

    return text.strip
  end
end
