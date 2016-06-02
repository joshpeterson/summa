require_relative "../../summa-parser/models/article"
require_relative "../../summa-parser/models/question"
require_relative "../../summa-parser/models/treatise"
require_relative "../../summa-parser/models/part"
require_relative "../../summa-parser/models/summa"
require_relative "title_parser"

class SummaryGenerator
  def write(summa)
    title = TitleParser.new
    summary = "# Summary\n"

    for part in summa.parts
      path = Array.new
      part_title = title.format_title(part.title)
      path.push(part_title)
      summary += emit_entry(0, part_title, append_prologue_link(path)) + "\n"
      for treatise in part.treatises
        treatise_title = title.format_title(treatise.title)
        path.push(treatise_title)
        summary += emit_entry(2, treatise_title, append_prologue_link(path)) + "\n"
        for question in treatise.questions
          question_title = title.format_title(question.title)
          path.push(question_title)
          summary += emit_entry(4, question_title, append_prologue_link(path)) + "\n"
          for article in question.articles
            article_title = title.format_title(article.title)
            summary += emit_entry(6, article_title, append_to_path(path_from_stack(path),
                                  emit_article_markdown_filename(article.title))) + "\n"
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

  def append_prologue_link(path)
    return append_to_path(path_from_stack(path), "prologue.md")
  end

  def emit_article_markdown_filename(title)
    return "#{make_string_for_path(title)}.md"
  end

  def path_from_stack(stack)
    path = ""
    for entry in stack
      path += "#{make_string_for_path(entry)}/"
    end
    return path.chomp("/")
  end

  private

  def append_to_path(path, toAppend)
    "#{path}/#{toAppend}"
  end

  def make_string_for_path(value)
    return "#{value.gsub(/\s+/, "_").gsub(/[[:punct:]]?$/, "").downcase}"
  end
end
