require 'test_helper'

class ArticlesControllerViewTest < ActionController::TestCase
  def setup
    @controller = ArticlesController.new
  end

  def get_article(number)
    get(:show, :id => number)
    @statements = css_select("div.statement")
    @replies = css_select("div.reply")
    @contexts = css_select("div.context")
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
    assert_equal(1, @replies.count, "Wrong number of replies found")
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

  test "view for first article has proper part context" do
    get_article("1")
    assert_match("Part: <a href=\"/parts/1\">FIRST PART</a>" +
                 " - Article 13 of 42", @contexts[1].inner_html)
  end

  test "view for first article has proper treatise context" do
    get_article("1")
    assert_match("Treatise: <a href=\"/treatises/1\">First treatise</a>" +
                 " - Article 12 of 42", @contexts[2].inner_html)
  end

  test "view for first article has proper question context" do
    get_article("1")
    assert_match("Question: <a href=\"/questions/1\">First question</a>" +
                 " - Article 11 of 42", @contexts[3].inner_html)
  end

  test "view for the first article has the proper next article" do
    get_article("1")
    assert_match("Next: <a href=\"/articles/2\">Second article title</a>",
                 @contexts[0].inner_html)
  end

  test "view for the second article has the proper previous article" do
    get_article("2")
    assert_match("Previous: <a href=\"/articles/1\">First article title</a>",
                 @contexts[1].inner_html)
  end
end
