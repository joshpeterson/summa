gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/treatise_writer"
require_relative "../../summa-parser/models/treatise.rb"
require_relative "../../summa-parser/models/question.rb"

class TestTreatiseWriter < MiniTest::Test
  def test_starts_with_treatise_title
    treatise = TreatiseParsed.new("TiTle *[]", "", Array.new)
    assert_startswith("# Title", TreatiseWriter.write(treatise))
  end

  def test_includes_prologue
    treatise = TreatiseParsed.new("Treatise Foo", "Prologue text.", Array.new)
    assert_equal($expected_with_prologue_and_title, TreatiseWriter.write(treatise))
  end

  def test_with_nil_prologue
    treatise = TreatiseParsed.new("Treatise Foo", nil, Array.new)
    assert_equal("# Treatise Foo", TreatiseWriter.write(treatise))
  end

  def test_with_questions
    questions = [QuestionParsed.new("Question 1 Title", "", Array.new),
                 QuestionParsed.new("Question 2 title", "", Array.new)]
    treatise = TreatiseParsed.new("Treatise Foo", "Prologue text.", questions)
    assert_equal($expected_with_questions, TreatiseWriter.write(treatise))
  end

  $expected_with_prologue_and_title = "# Treatise Foo

Prologue text."

  $expected_with_questions = "# Treatise Foo

Prologue text.

* Question 1 Title
* Question 2 Title"
end