gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/prologue_writer"

class TestPrologueWriter < MiniTest::Test
  def test_prologue_starts_with_title
    prologue = PrologueWriter.write("Test PART TITle (FOO *)", "")
    assert_startswith("# Test Part Title", prologue)
  end

  def test_full_prologue
    prologue = PrologueWriter.write("Test PART TITle (FOO *)",
                                      "This is the prologue text.")
    assert_equal($expected_prologue, prologue)
  end

$expected_prologue = "# Test Part Title

This is the prologue text."
end
