# frozen_string_literal: true

require_relative '../models/treatise'
require_relative 'question_parser'

class TreatiseParser
  def initialize(treatise_text)
    @treatise = parse(treatise_text)
  end

  attr_reader :treatise

  private

  def parse(treatise_text)
    title = parse_title(treatise_text)
    prologue = parse_prologue(treatise_text)
    questions = parse_questions(treatise_text)
    TreatiseParsed.new(title, prologue, questions)
  end

  def parse_title(treatise_text)
    start_index = treatise_text.index(/^TREATISE/)
    end_index = treatise_text.index(/\n/, start_index + 1)
    treatise_text[start_index..end_index].strip
  end

  def parse_prologue(treatise_text)
    start_index, end_index = get_prologue_start_and_end(treatise_text)
    return nil if start_index.nil?
    treatise_text[start_index..end_index].tr("\n", ' ')
                                         .gsub('    ', ' ').strip
  end

  def get_prologue_start_and_end(treatise_text)
    start_index = treatise_text.index(/^  PROLOGUE/)
    return nil, nil if start_index.nil?
    start_index += 11 # '  PROLOGUE'.length + 1
    end_index = treatise_text.index(/^     ______/, start_index + 1)
    [start_index, end_index]
  end

  def parse_questions(treatise_text)
    prologue_start_index, prologue_end_index =
      get_prologue_start_and_end(treatise_text)
    unless prologue_start_index.nil?
      treatise_text = treatise_text[prologue_end_index + 1..-1]
    end

    number_of_questions = treatise_text.scan(/^  [A-Z][A-Z]\n*?.*?\)/m)
                                       .size
    start_index = treatise_text.index(/^  [A-Z][A-Z]\n*?.*?\)/m)
    Array.new(number_of_questions) do
      after_question_title_index = treatise_text.index(/^\n/,
                                                       start_index + 1)
      next_start_index = treatise_text.index(/^  [A-Z][A-Z]\n*?.*?\)/m,
                                             after_question_title_index + 1)
      end_index = find_end_index(treatise_text, next_start_index)
      question_text = treatise_text[start_index..end_index]
      start_index = next_start_index
      QuestionParser.new(question_text).question
    end
  end

  def find_end_index(treatise_text, next_start_index)
    if !next_start_index.nil?
      treatise_text.rindex(/__/, next_start_index)
    else
      treatise_text.length - 1
    end
  end
end
