require 'pathname'
require 'fileutils'
require_relative '../../summa-parser/load'
require_relative 'summary_generator'
require_relative 'prologue_writer'
require_relative 'utils'

def path_in_book(filename)
 Pathname.new(__dir__ + "/../../book/#{filename}")
end

def write_to_file(path, content)
  filename = path_in_book(Utils.append_prologue_link(path))
  FileUtils::mkdir_p filename.dirname
  print "Writing to #{filename.cleanpath}\n"
  File.open(filename.cleanpath, 'w') {|f| f.write(content) }
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
  write_to_file(path, PrologueWriter.write(part_title, part.prologue,
                                           part.treatises))
  for treatise in part.treatises
    treatise_title = TitleParser.format_title(treatise.title)
    path.push(treatise_title)
    write_to_file(path, PrologueWriter.write(treatise_title, treatise.prologue,
                                             treatise.questions))
    for question in treatise.questions
      question_title = TitleParser.format_title(question.title)
      path.push(question_title)
      write_to_file(path, PrologueWriter.write(question_title, question.content,
                                               question.articles))
      for article in question.articles
        article_title = TitleParser.format_title(article.title)
      end
      path.pop
    end
    path.pop
  end
  path.pop
end
