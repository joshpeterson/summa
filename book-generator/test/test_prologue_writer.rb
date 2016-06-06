gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/prologue_writer"

class TestPrologueWriter < MiniTest::Test
  def test_prologue_starts_with_title
    entries = Array.new
    prologue = PrologueWriter.write("Test PART TITle (FOO *)", "", entries)
    assert_startswith("# Test Part Title", prologue)
  end

  def test_full_prologue
    entries = [HasTitle.new("FIRST ENTRY"), HasTitle.new("SeCond entry")]
    prologue = PrologueWriter.write("Test PART TITle (FOO *)",
                                    "This is the prologue text.", entries)
    assert_equal($expected_prologue, prologue)
  end

  def test_full_prologue_empty_content
    entries = [HasTitle.new("FIRST ENTRY"), HasTitle.new("SeCond entry")]
    prologue = PrologueWriter.write("Test PART TITle (FOO *)", "", entries)
    assert_equal($expected_prologue_empty_content, prologue)
  end

  def test_full_prologue_nil_content
    entries = [HasTitle.new("FIRST ENTRY"), HasTitle.new("SeCond entry")]
    prologue = PrologueWriter.write("Test PART TITle (FOO *)", nil, entries)
    assert_equal($expected_prologue_empty_content, prologue)
  end

$expected_prologue = "# Test Part Title

This is the prologue text.

* First Entry
* Second Entry"

$expected_prologue_empty_content = "# Test Part Title

* First Entry
* Second Entry"
end

class HasTitle
  def initialize(title)
    @title = title
  end

  attr_reader :title
end
