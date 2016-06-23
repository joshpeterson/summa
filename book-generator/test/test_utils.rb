gem "minitest"
require "minitest/autorun"
require_relative "../generator/utils"

class UtilsTest < MiniTest::Test
  def test_append_prologue_link
    path = Array.new
    path.push("First Part")
    link = Utils.append_prologue_link(path)
    assert_equal("first_part/prologue.md", link)
  end

  def test_emit_markdown_filename
    filename = Utils.emit_markdown_filename("Whether God is one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_emit_markdown_filename_strips_commas
    filename = Utils.emit_markdown_filename("Whether, God is, one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_emit_markdown_filename_strips_apostrophes
    filename = Utils.emit_markdown_filename("Whether' God is' one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_path_from_stack
    stack = Array.new
    stack.push("First Part")
    stack.push("Treatise on the one God")
    path = Utils.path_from_stack(stack)
    assert_equal("first_part/treatise_on_the_one_god", path)
  end

  def test_removes_trailing_parantheses
    assert_equal("FIRST_PART", Utils.sanitize("FIRST PART (QQ[1] - 15)"))
  end

  def test_removes_embedded_parantheses
    assert_equal("FIRST_PART", Utils.sanitize("FIRST (FP) PART"))
  end

  def test_removes_embedded_bracket
    assert_equal("FIRST_PART", Utils.sanitize("FIRST [1] PART"))
  end

  def test_removes_double_embedded_bracket
    assert_equal("FIRST_PART", Utils.sanitize("FIRST [*Cf. FP, Q[12]] PART"))
  end

  def test_removes_an_embedded_asterisk
    assert_equal("OF_HONESTY_TWO", Utils.sanitize("OF HONESTY* TWO"))
  end

  def test_removes_an_embedded_period
    assert_equal("OF_HONESTY_ie", Utils.sanitize("OF HONESTY i.e."))
  end

  def test_removes_embedded_curly_braces
    assert_equal("OF_HONESTY_foo", Utils.sanitize("OF HONESTY {foo}"))
  end

  def test_removes_embedded_double_quotes
    assert_equal("OF_HONESTY_foo", Utils.sanitize("OF HONESTY \"foo\""))
  end

  def test_removes_embedded_single_quotes
    assert_equal("OF_HONESTY_foo", Utils.sanitize("OF HONESTY 'foo'"))
  end

  def test_removes_embedded_dashes
    assert_equal("OF_HONESTY_foo", Utils.sanitize("OF HONESTY --- foo"))
  end

  def test_removes_embedded_colon
    assert_equal("OF_HONESTY_foo", Utils.sanitize("OF HONESTY: foo"))
  end


end
