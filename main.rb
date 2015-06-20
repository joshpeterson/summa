require_relative 'parser/summa_parser.rb'
def load()
    text = File.open("summa.txt", "rb") { |f| f.read }
    SummaParser.new(text).summa
end
