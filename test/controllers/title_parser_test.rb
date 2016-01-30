require 'test_helper'

class TitleParserTest < ActionController::TestCase
  include TitleParser

  test "removes trailing parantheses" do
    assert_equal("FIRST PART", strip_parantheses("FIRST PART (QQ[1] - 15)"))
  end

  test "removes embedded parantheses" do
    assert_equal("FIRST PART", strip_parantheses("FIRST (FP) PART"))
  end

  test "removes embedded brackets" do
    assert_equal("FIRST PART", strip_parantheses("FIRST [1] PART"))
  end

  test "changes the casing to title casing" do
    assert_equal("First Part", title_casing_for("FIRST PART"))
  end

  test "formats a title correctly" do
    assert_equal("First Part", format_title("FIRST (FP) PART* (QQ[1] - 15)"))
  end

  test "removes an embedded asterisk" do
    assert_equal("OF HONESTY [Test]", strip_asterisk("OF HONESTY* [Test]"))
  end
end

