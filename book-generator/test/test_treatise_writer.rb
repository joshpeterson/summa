# frozen_string_literal: true

gem 'minitest'
require 'minitest/autorun'
require_relative 'custom_assertions'
require_relative '../generator/treatise_writer'
require_relative '../../summa-parser/models/treatise'
require_relative '../../summa-parser/models/question'

class TestTreatiseWriter < MiniTest::Test
  def test_starts_with_treatise_title
    treatise = TreatiseParsed.new('TiTle *[]', '', [])
    assert_startswith('# Title', TreatiseWriter.write(treatise))
  end

  def test_includes_prologue
    treatise = TreatiseParsed.new('Treatise Foo', 'Prologue text.', [])
    assert_equal(EXPECTED_WITH_PROLOGUE_AND_TITLE, TreatiseWriter.write(treatise))
  end

  def test_with_nil_prologue
    treatise = TreatiseParsed.new('Treatise Foo', nil, [])
    assert_equal('# Treatise Foo', TreatiseWriter.write(treatise))
  end

  def test_with_questions
    questions = [QuestionParsed.new('Question 1 Title', '', []),
                 QuestionParsed.new('Question 2 title', '', [])]
    treatise = TreatiseParsed.new('Treatise Foo', 'Prologue text.', questions)
    assert_equal(EXPECTED_WITH_QUESTIONS, TreatiseWriter.write(treatise))
  end
end

EXPECTED_WITH_PROLOGUE_AND_TITLE = "# Treatise Foo

Prologue text."

EXPECTED_WITH_QUESTIONS = "# Treatise Foo

Prologue text.

* Question 1 Title
* Question 2 Title"
