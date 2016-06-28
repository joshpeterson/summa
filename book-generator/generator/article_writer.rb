require_relative "../../summa-parser/models/article"
require_relative "title_parser"

class ArticleWriter
  def self.write(article)
    text = "## #{TitleParser.format_title(article.title)}\n\n"
    text += "### Objections\n\n"
    for objection in article.objections
      text += "#{objection.statement}\n\n"
    end

    text += "### Answer\n\n"
    text += "#{article.contrary}\n\n"
    text += "#{article.answer}\n\n"

    if article.objections.any? {|o| !o.reply.nil?}
      text += "### Replies\n\n"
      for objection in article.objections
        if !objection.reply.nil?
          text += "#{objection.reply}\n\n"
        end
      end
    end

    return text.strip
  end
end
