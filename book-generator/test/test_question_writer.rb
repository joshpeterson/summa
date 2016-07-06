gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/question_writer"

class TestQuestionWriter < MiniTest::Test
  def test_prologue_starts_with_title
    prologue = QuestionWriter.write("Test PART TITle (FOO *)", "")
    assert_startswith("## Test Part Title", prologue)
  end

  def test_full_prologue
    prologue = QuestionWriter.write("Test PART TITle (FOO *)",
                                    "This is the prologue text.")
    assert_equal($expected_prologue, prologue)
  end

  def test_full_prologue_empty_content
    prologue = QuestionWriter.write("Test PART TITle (FOO *)", "")
    assert_equal($expected_prologue_empty_content, prologue)
  end

  def test_full_prologue_nil_content
    prologue = QuestionWriter.write("Test PART TITle (FOO *)", nil)
    assert_equal($expected_prologue_empty_content, prologue)
  end

$expected_prologue = "## Test Part Title

This is the prologue text."

$expected_prologue_empty_content = "## Test Part Title"
end

class HasTitle
  def initialize(title)
    @title = title
  end

  attr_reader :title
end
