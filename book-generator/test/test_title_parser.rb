gem "minitest"
require "minitest/autorun"
require_relative "../generator/title_parser"

class TitleParserTest < MiniTest::Test
  def test_removes_trailing_parantheses
    assert_equal("FIRST PART",
                 TitleParser.strip_parantheses("FIRST PART (QQ[1] - 15)"))
  end

  def test_removes_embedded_parantheses
    assert_equal("FIRST PART", TitleParser.strip_parantheses("FIRST (FP) PART"))
  end

  def test_removes_embedded_bracket
    assert_equal("FIRST PART", TitleParser.strip_parantheses("FIRST [1] PART"))
  end

  def test_changes_the_casing_to_title_casing
    assert_equal("First Part", TitleParser.title_casing_for("FIRST PART"))
  end

  def test_formats_a_title_correctly
    assert_equal("First Part",
                 TitleParser.format_title("FIRST (FP) PART* (QQ[1] - 15)"))
  end

  def test_removes_an_embedded_asterisk
    assert_equal("OF HONESTY [Test]",
                 TitleParser.strip_asterisk("OF HONESTY* [Test]"))
  end

  def test_capitalizes_a_word_quotation_marks
    assert_equal('First "Part"', TitleParser.title_casing_for('FIRST "PART"'))
  end
end
