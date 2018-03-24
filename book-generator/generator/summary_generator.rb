# frozen_string_literal: true

require_relative '../../summa-parser/models/article'
require_relative '../../summa-parser/models/question'
require_relative '../../summa-parser/models/treatise'
require_relative '../../summa-parser/models/part'
require_relative '../../summa-parser/models/summa'
require_relative 'title_parser'
require_relative 'utils'

class SummaryGenerator
  def write(summa)
    summary = "# Summary\n\n* [Introduction](README.md)\n"

    summa.parts.each do |part|
      path = []
      part_title = TitleParser.format_title(part.title)
      path.push(part_title)
      summary += emit_heading(2, part_title)
      part.treatises.each do |treatise|
        treatise_title = TitleParser.format_title(treatise.title)
        summary += emit_entry(0, treatise_title,
                              Utils.append_to_path(Utils.path_from_stack(path),
                                                   Utils.emit_markdown_filename(
                                                     treatise.title
                                                   ))) + "\n"
      end
      path.pop
    end

    summary
  end

  def emit_entry(indent, text, link)
    offset = ' ' * indent
    "#{offset}* [#{text}](#{link})"
  end

  def emit_heading(level, text)
    heading = '#' * level
    "\n#{heading} #{text}\n"
  end
end
