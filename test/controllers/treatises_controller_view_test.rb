require 'test_helper'

class TreatisesControllerViewTest < ActionController::TestCase
  def setup
    @controller = TreatisesController.new
  end

  def get_treatise(number)
    get(:show, :id => number)
    @uls = css_select("ul")
    @lis = css_select(@uls[0], "li")
  end

  test "view has the proper title" do
    get_treatise("1")
    assert_select("title", "First treatise")
  end

  test "view has proper header" do
    get_treatise("1")
    assert_select("div.title", "First treatise")
  end

  test "view with a prologue has proper prologue" do
    get_treatise("1")
    assert_select("div.prologue", "Prologue for first treatise")
  end

  test "view without a prologue does not have a prologue" do
    get_treatise("2")
    assert_select("div.prologue", false, "This treatise does not have a prologue")
  end

  test "view for first treatise has proper number of questions" do
    get_treatise("1")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for second treatise has proper number of questions" do
    get_treatise("2")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for first treatise has proper first question" do
    get_treatise("1")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "First question")
  end

  test "view for first treatise has proper second question" do
    get_treatise("1")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Second question")
  end

  test "view for second treatise has proper first question" do
    get_treatise("2")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "Third question")
  end

  test "view for second treatise has proper second question" do
    get_treatise("2")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Fourth question")
  end

  test "view for first treatise has proper link to first question" do
    get_treatise("1")
    assert_select("a[href=?]", "/questions/1")
  end

  test "view for first treatise has proper link to second question" do
    get_treatise("1")
    assert_select("a[href=?]", "/questions/2")
  end

  test "view for second treatise has proper link to first question" do
    get_treatise("2")
    assert_select("a[href=?]", "/questions/3")
  end

  test "view for second treatise has proper link to second question" do
    get_treatise("2")
    assert_select("a[href=?]", "/questions/4")
  end
end
