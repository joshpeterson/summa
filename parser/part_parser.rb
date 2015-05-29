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
        prologue = parse_prologue part_text
        part = Part.new title, prologue, nil 
    end

    def parse_title(part_text)
        start_index = part_text.index /^.*PART \(/
        end_index = part_text.index /\n/, start_index+1
        part_text[start_index..end_index].strip()
    end

    def parse_prologue(part_text)
        start_index = part_text.index /^PROLOGUE/
        if (start_index == nil)
            return nil
        end
        start_index += "PROLOGUE".length + 1
        end_index = part_text.index /^     ______/, start_index
        # This is a horrible regex (three, actually).
        # 1. Strip newlines that are not empty lines.
        # 2. Replace two or more spaces with one space.
        # 3. Replace a space at the end of any line with nothing.
        part_text[start_index..end_index].gsub(/(?<!^)\n/, " ").gsub(/[ ]{2,}/, " ").gsub(/^\s/, "").gsub(/ $/, "")
    end
end
