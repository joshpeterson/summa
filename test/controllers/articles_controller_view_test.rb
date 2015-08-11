require 'test_helper'

class ArticlesControllerViewTest < ActionController::TestCase
  def setup
    @controller = ArticlesController.new
  end

  def get_article(number)
    get(:show, :id => number)
    @statements = css_select("div.statement")
    @replies = css_select("div.reply")
  end

  test "view has the proper title" do
    get_article("1")
    assert_select("title", "First article title")
  end

  test "view has proper header" do
    get_article("1")
    assert_select("div.title", "First article title")
  end

  test "view has proper contrary" do
    get_article("1")
    assert_select("div.contrary", "First article contrary")
  end

  test "view has proper answer" do
    get_article("1")
    assert_select("div.answer", "First article answer")
  end

  test "view for first article has proper number of objection statements" do
    get_article("1")
    assert_equal(2, @statements.count, "Wrong number of statements found")
  end

  test "view for second article has proper number of objection statements" do
    get_article("2")
    assert_equal(2, @statements.count, "Wrong number of statements found")
  end

  test "view for first article has proper number of objection replies" do
    get_article("1")
    assert_equal(2, @replies.count, "Wrong number of replies found")
  end

  test "view for second article has proper number of objection replies" do
    get_article("2")
    assert_equal(2, @replies.count, "Wrong number of replies found")
  end

  test "view for first article has proper first statement objection" do
    get_article("1")
    assert_match("First objection statement", @statements[0].inner_html)
  end

  test "view for first article has proper first statement reply" do
    get_article("1")
    assert_match("First objection reply",@replies[0].inner_html)
  end

  test "view for first article has proper second statement objection" do
    get_article("1")
    assert_match("Second objection statement", @statements[1].inner_html)
  end

  test "view for first article has proper second statement reply" do
    get_article("1")
    assert_match("Second objection reply", @replies[1].inner_html)
  end

  test "view for second article has proper first statement objection" do
    get_article("2")
    assert_match("Third objection statement", @statements[0].inner_html)
  end

  test "view for second article has proper first statement reply" do
    get_article("2")
    assert_match("Third objection reply", @replies[0].inner_html)
  end

  test "view for second article has proper second statement objection" do
    get_article("2")
    assert_match("Fourth objection statement",@statements[1].inner_html )
  end

  test "view for second article has proper second statement reply" do
    get_article("2")
    assert_match("Fourth objection reply", @replies[1].inner_html)
  end
end
