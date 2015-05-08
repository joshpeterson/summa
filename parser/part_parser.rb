require_relative '../models/part'
require_relative 'treatise_parser'

class PartParser
	def initialize(part_text)
		@part = parse part_text
	end

	attr_reader :part

    private

    def parse(part_text)
        title = parse_title part_text
        part = Part.new title, nil, nil 
    end

    def parse_title(part_text)
        start_index = part_text.index /^.*PART \(/
        end_index = part_text.index /\n/, start_index+1
        part_text[start_index..end_index].strip()
    end
end
