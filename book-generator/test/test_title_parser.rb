gem "minitest"
require "minitest/autorun"
require_relative "../generator/title_parser"

class TitleParserTest < MiniTest::Test
  def test_changes_the_casing_to_title_casing
    assert_equal("First Part", TitleParser.title_casing_for("FIRST PART"))
  end

  def test_formats_a_title_correctly
    assert_equal("First Part",
                 TitleParser.format_title("FIRST (FP) PART* [(QQ[1] - 15)]"))
  end

  def test_capitalizes_a_word_quotation_marks
    assert_equal('First "Part"', TitleParser.title_casing_for('FIRST "PART"'))
  end

  def test_formats_a_title_with_double_square_brackets
    assert_equal("First Part",
                 TitleParser.format_title("FIRST PART
                  [*There is no further mention of these remedies in the text,
                  except in A[4].]"))
  end
end
