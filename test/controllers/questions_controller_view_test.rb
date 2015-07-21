require 'test_helper'

class QuestionsControllerViewTest < ActionController::TestCase
  def setup
    @controller = QuestionsController.new
  end

  def get_question(number)
    get(:show, :id => number)
    @uls = css_select("ul")
    @lis = css_select(@uls[0], "li")
  end

  test "view has the proper title" do
    get_question("1")
    assert_select("title", "First question")
  end

  test "view has proper header" do
    get_question("1")
    assert_select("div.title", "First question")
  end

  test "view has proper content" do
    get_question("1")
    assert_select("div.content", "Content for first question.")
  end

  test "view for first question has proper number of articles" do
    get_question("1")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for second question has proper number of articles" do
    get_question("2")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for first question has proper first article" do
    get_question("1")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "First article title")
  end

  test "view for first question has proper second article" do
    get_question("1")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Second article title")
  end

  test "view for second question has proper first article" do
    get_question("2")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "Third article title")
  end

  test "view for second question has proper second article" do
    get_question("2")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Fourth article title")
  end

  test "view for first question has proper link to first article" do
    get_question("1")
    assert_select("a[href=?]", "/articles/1")
  end

  test "view for first question has proper link to second article" do
    get_question("1")
    assert_select("a[href=?]", "/articles/2")
  end

  test "view for second question has proper link to first article" do
    get_question("2")
    assert_select("a[href=?]", "/articles/3")
  end

  test "view for second question has proper link to second article" do
    get_question("2")
    assert_select("a[href=?]", "/articles/4")
  end
end
