require_relative "../../summa-parser/models/article"
require_relative "title_parser"

class ArticleWriter
  def self.write(article)
    text = "# #{TitleParser.format_title(article.title)}\n"
    text += "## Objections\n"
    for objection in article.objections
      text += "#{objection.statement}\n"
    end

    text += "## Answer\n"
    text += "#{article.contrary}\n"
    text += "#{article.answer}\n"

    if article.objections.any? {|o| !o.reply.nil?}
      text += "## Replies\n"
      for objection in article.objections
        if !objection.reply.nil?
          text += "#{objection.reply}\n"
        end
      end
    end

    return text.strip
  end
end
