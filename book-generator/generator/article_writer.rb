require_relative "../../summa-parser/models/article"
require_relative "title_parser"

class ArticleWriter
  def self.write(article)
    text = "### #{TitleParser.format_title(article.title)}\n\n"

    text += "#{article.contrary}\n\n"
    text += "---\n\n"
    text += "#{article.answer}\n\n"

    for objection in article.objections
      text += "---\n\n"
      text += "#{objection.statement}\n\n"
      if !objection.reply.nil?
        text += "#{objection.reply}\n\n"
      end
    end

    return text.strip
  end
end
