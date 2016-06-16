gem "minitest"
require "minitest/autorun"
require_relative "../generator/title_parser"

class TitleParserTest < MiniTest::Test
  def test_removes_trailing_parantheses
    assert_equal("FIRST PART", TitleParser.sanitize("FIRST PART (QQ[1] - 15)"))
  end

  def test_removes_embedded_parantheses
    assert_equal("FIRST PART", TitleParser.sanitize("FIRST (FP) PART"))
  end

  def test_removes_embedded_bracket
    assert_equal("FIRST PART", TitleParser.sanitize("FIRST [1] PART"))
  end

  def test_removes_double_embedded_bracket
    assert_equal("FIRST PART", TitleParser.sanitize("FIRST [*Cf. FP, Q[12]] PART"))
  end

  def test_changes_the_casing_to_title_casing
    assert_equal("First Part", TitleParser.title_casing_for("FIRST PART"))
  end

  def test_formats_a_title_correctly
    assert_equal("First Part",
                 TitleParser.format_title("FIRST (FP) PART* (QQ[1] - 15)"))
  end

  def test_removes_an_embedded_asterisk
    assert_equal("OF HONESTY TWO", TitleParser.sanitize("OF HONESTY* TWO"))
  end

  def test_removes_an_embedded_period
    assert_equal("OF HONESTY ie", TitleParser.sanitize("OF HONESTY i.e."))
  end

  def test_removes_embedded_curly_braces
    assert_equal("OF HONESTY foo", TitleParser.sanitize("OF HONESTY {foo}"))
  end

  def test_removes_embedded_double_quotes
    assert_equal("OF HONESTY foo", TitleParser.sanitize("OF HONESTY \"foo\""))
  end

  def test_removes_embedded_single_quotes
    assert_equal("OF HONESTY foo", TitleParser.sanitize("OF HONESTY 'foo'"))
  end

  def test_removes_embedded_dashes
    assert_equal("OF HONESTY foo", TitleParser.sanitize("OF HONESTY --- foo"))
  end

  def test_removes_embedded_colon
    assert_equal("OF HONESTY foo", TitleParser.sanitize("OF HONESTY: foo"))
  end

  def test_capitalizes_a_word_quotation_marks
    assert_equal('First "Part"', TitleParser.title_casing_for('FIRST "PART"'))
  end
end
