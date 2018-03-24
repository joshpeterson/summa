# frozen_string_literal: true

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
    number_of_parts = summa_text.scan(/^.* PART \(/).size
    start_index = summa_text.index(/^.* PART \(/)
    Array.new(number_of_parts) do
      next_start_index = summa_text.index(/^.* PART \(/, start_index + 1)
      end_index = find_end_index(summa_text, next_start_index)
      part_text = summa_text[start_index..end_index]
      start_index = next_start_index
      PartParser.new(part_text).part
    end
  end

  def find_end_index(summa_text, next_start_index)
    if !next_start_index.nil?
      summa_text.rindex(/^     ____/, next_start_index)
    else
      summa_text.length - 1
    end
  end
end
