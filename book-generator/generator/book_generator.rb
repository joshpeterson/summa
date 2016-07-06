require 'pathname'
require 'fileutils'
require_relative '../../summa-parser/load'
require_relative 'summary_generator'
require_relative 'treatise_writer'
require_relative 'question_writer'
require_relative 'article_writer'
require_relative 'utils'

def path_in_book(filename)
 Pathname.new(__dir__ + "/../../book/#{filename}")
end

def write_to_file(relative_filename, content)
  filename = path_in_book(relative_filename)
  FileUtils::mkdir_p filename.dirname
  print "Writing to #{filename.cleanpath}\n"
  File.open(filename.cleanpath, 'w') {|f| f.write(content) }
end

def prologue_for(path)
  Utils.append_prologue_link(path)
end

def markdown_filename_for(path, title)
  Utils.append_to_path(Utils.path_from_stack(path),
                       Utils.emit_markdown_filename(title))
end

print "Loading summa data from file\n"
summa = load()
summary_filename = path_in_book("SUMMARY.md")
print "Writing summary to '#{summary_filename.realpath}'\n"
summary = SummaryGenerator.new.write(summa)
File.open(summary_filename.realpath, 'w') {|f| f.write(summary) }
for part in summa.parts
  path = Array.new
  part_title = TitleParser.format_title(part.title)
  path.push(part_title)
  for treatise in part.treatises
    treatise_title = TitleParser.format_title(treatise.title)
    content = TreatiseWriter.write(treatise) + "\n\n" 
    for question in treatise.questions
      question_title = TitleParser.format_title(question.title)
      content += QuestionWriter.write(question_title, question.content) + "\n\n"
      for article in question.articles
        content += ArticleWriter.write(article) + "\n\n"
      end
    end
    write_to_file(markdown_filename_for(path, treatise_title), content)
  end
  path.pop
end
