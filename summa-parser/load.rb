# frozen_string_literal: true

require_relative 'parser/summa_parser'
def load
  text = File.open('summa.txt', 'rb', &:read)
  SummaParser.new(text).summa
end
