require_relative '../models/treatise'
require_relative 'question_parser'

class TreatiseParser
	def initialize(treatise_text)
		@treatise = parse treatise_text
	end

	attr_reader :treatise

    private

    def parse(treatise_text)
        title = parse_title treatise_text
        prologue = parse_prologue treatise_text
        questions = parse_questions treatise_text
        Treatise.new(title, prologue, questions)
    end

    def parse_title(treatise_text)
        start_index = treatise_text.index /^TREATISE/
        end_index = treatise_text.index /\n/, start_index+1
        treatise_text[start_index..end_index].strip()
    end

    def parse_prologue(treatise_text)
        start_index = treatise_text.index /^  PROLOGUE/
		if start_index == nil
			return nil
		end
        start_index += "  PROLOGUE".length + 1
        end_index = treatise_text.index /^     ______/, start_index+1
        treatise_text[start_index..end_index].gsub("\n", " ").gsub("    ", " ").strip
    end

    def parse_questions(treatise_text)
    end
end
