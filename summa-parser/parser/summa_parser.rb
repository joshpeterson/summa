require_relative '../models/summa'
require_relative 'part_parser'

class SummaParser
  def initialize(summa_text)
    @summa = parse(summa_text)
  end

  attr_reader :summa

  private

  def parse(summa_text)
    parts = parse_parts(summa_text)
    SummaParsed.new(parts)
  end

  def parse_parts(summa_text)
    parts = Array.new
    number_of_parts = summa_text.scan(/^.* PART \(/).size
    start_index = summa_text.index(/^.* PART \(/)
    for i in 0..number_of_parts-1
      next_start_index = summa_text.index(/^.* PART \(/, start_index+1)
      if (next_start_index != nil)
        end_index = summa_text.rindex(/^     ____/, next_start_index)
      else
        end_index = summa_text.length - 1
      end
      parser = PartParser.new(summa_text[start_index..end_index])
      parts.push(parser.part)
      start_index = next_start_index
    end

    return parts
  end
end
