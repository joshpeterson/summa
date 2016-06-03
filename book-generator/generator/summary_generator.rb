require_relative "../../summa-parser/models/article"
require_relative "../../summa-parser/models/question"
require_relative "../../summa-parser/models/treatise"
require_relative "../../summa-parser/models/part"
require_relative "../../summa-parser/models/summa"
require_relative "title_parser"
require_relative "utils"

class SummaryGenerator
  def write(summa)
    summary = "# Summary\n"

    for part in summa.parts
      path = Array.new
      part_title = TitleParser.format_title(part.title)
      path.push(part_title)
      summary += emit_entry(0, part_title, Utils.append_prologue_link(path)) + "\n"
      for treatise in part.treatises
        treatise_title = TitleParser.format_title(treatise.title)
        path.push(treatise_title)
        summary += emit_entry(2, treatise_title,
                              Utils.append_prologue_link(path)) + "\n"
        for question in treatise.questions
          question_title = TitleParser.format_title(question.title)
          path.push(question_title)
          summary += emit_entry(4, question_title,
                                Utils.append_prologue_link(path)) + "\n"
          for article in question.articles
            article_title = TitleParser.format_title(article.title)
            summary += emit_entry(6, article_title,
                      Utils.append_to_path(Utils.path_from_stack(path),
                      Utils.emit_article_markdown_filename(article.title))) + "\n"
          end
          path.pop
        end
        path.pop
      end
      path.pop
    end

    return summary
  end

  def emit_entry(indent, text, link)
    offset = " " * indent
    "#{offset}* [#{text}](#{link})"
  end
end
