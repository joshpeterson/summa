class SummaryGenerator
  def Write(summa)
    summary = "# Summary\n"

    for part in summa.parts
      path = Array.new
      path.push(part.title)
      summary += EmitEntry(0, part.title, AppendPrologueLink(path)) + "\n"
      for treatise in part.treatises
        path.push(treatise.title)
        summary += EmitEntry(2, treatise.title, AppendPrologueLink(path)) + "\n"
        for question in treatise.questions
          path.push(question.title)
          summary += EmitEntry(4, question.title, AppendPrologueLink(path)) + "\n"
          for article in question.articles
            summary += EmitEntry(6, article.title, AppendToPath(PathFromStack(path),
                                 EmitArticleMarkdownFilename(article.title))) + "\n"
          end
          path.pop
        end
        path.pop
      end
      path.pop
    end

    return summary
  end

  def EmitEntry(indent, text, link)
    offset = " " * indent
    "#{offset}* [#{text}](#{link})"
  end

  def AppendPrologueLink(path)
    return AppendToPath(PathFromStack(path), "prologue.md")
  end

  def EmitArticleMarkdownFilename(title)
    return "#{MakeStringForPath(title)}.md"
  end

  def PathFromStack(stack)
    path = ""
    for entry in stack
      path += "#{MakeStringForPath(entry)}/"
    end
    return path.chomp("/")
  end

  private

  def AppendToPath(path, toAppend)
    "#{path}/#{toAppend}"
  end

  def MakeStringForPath(value)
    return "#{value.gsub(/\s+/, "_").gsub(/[[:punct:]]?$/, "").downcase}"
  end
end
