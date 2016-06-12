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

  def test_emit_article_markdown_filename
    filename = Utils.emit_article_markdown_filename("Whether God is one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_emit_article_markdown_filename_strips_commas
    filename = Utils.emit_article_markdown_filename("Whether, God is, one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_emit_article_markdown_filename_strips_apostrophes
    filename = Utils.emit_article_markdown_filename("Whether' God is' one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_path_from_stack
    stack = Array.new
    stack.push("First Part")
    stack.push("Treatise on the one God")
    path = Utils.path_from_stack(stack)
    assert_equal("first_part/treatise_on_the_one_god", path)
  end

end
