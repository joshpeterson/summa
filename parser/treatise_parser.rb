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
        start_index, end_index = get_prologue_start_and_end(treatise_text)
        if start_index == nil
            return nil
        end
        treatise_text[start_index..end_index].gsub("\n", " ").gsub("    ", " ").strip
    end

    def get_prologue_start_and_end(treatise_text)
        start_index = treatise_text.index /^  PROLOGUE/
		if start_index == nil
			return nil, nil
		end
        start_index += "  PROLOGUE".length + 1
        end_index = treatise_text.index /^     ______/, start_index+1
        return start_index, end_index
    end

    def parse_questions(treatise_text)
        prologue_start_index, prologue_end_index = get_prologue_start_and_end(treatise_text)
		if prologue_start_index != nil
            treatise_text = treatise_text[prologue_end_index+1]
		end

        number_of_questions = treatise_text.scan(/^  [A-Z]/).size
		questions = Array.new number_of_questions

        start_index = treatise_text.index /^  [A-Z]/
		for i in 0..number_of_questions-1
            next_start_index = treatise_text.index /^  [A-Z]/, start_index+1
            if next_start_index != nil
                end_index = treatise_text.rindex /__/, next_start_index
            else
                end_index = treatise_text.length - 1
            end
            question_text = treatise_text[start_index..end_index]
            question_parser = QuestionParser.new question_text
            questions[i] = question_parser.question
            start_index = next_start_index
		end
		return questions
    end
end
