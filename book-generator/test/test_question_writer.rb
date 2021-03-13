# frozen_string_literal: true

gem 'minitest'
require 'minitest/autorun'
require_relative 'custom_assertions'
require_relative '../generator/question_writer'

class TestQuestionWriter < MiniTest::Test
  def test_prologue_starts_with_title
    prologue = QuestionWriter.write('Test PART TITle (FOO *)', '')
    assert_startswith('## Test Part Title', prologue)
  end

  def test_full_prologue
    prologue = QuestionWriter.write('Test PART TITle (FOO *)',
                                    'This is the prologue text.')
    assert_equal(EXPECTED_PROLOGUE, prologue)
  end

  def test_full_prologue_empty_content
    prologue = QuestionWriter.write('Test PART TITle (FOO *)', '')
    assert_equal(EXPECTED_PROLOGUE_EMPTY_CONTENT, prologue)
  end

  def test_full_prologue_nil_content
    prologue = QuestionWriter.write('Test PART TITle (FOO *)', nil)
    assert_equal(EXPECTED_PROLOGUE_EMPTY_CONTENT, prologue)
  end
end

EXPECTED_PROLOGUE = "## Test Part Title

This is the prologue text."

EXPECTED_PROLOGUE_EMPTY_CONTENT = '## Test Part Title'

class HasTitle
  def initialize(title)
    @title = title
  end

  attr_reader :title
end
