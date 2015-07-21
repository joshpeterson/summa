require 'test_helper'

class PartsControllerViewTest < ActionController::TestCase
  def setup
    @controller = PartsController.new
  end

  def get_part(number)
    get(:show, :id => number)
    @uls = css_select("ul")
    @lis = css_select(@uls[0], "li")
  end

  test "view has the proper title" do
    get_part("1")
    assert_select("title", "FIRST PART")
  end

  test "view has proper header" do
    get_part("1")
    assert_select("div.title", "FIRST PART")
  end

  test "view with a prologue has proper prologue" do
    get_part("1")
    assert_select("div.prologue", "This part has a prologue")
  end

  test "view without a prologue does not have a prologue" do
    get_part("2")
    assert_select("div.prologue", false, "This part does not have a prologue")
  end

  test "view for first part has proper number of treatises" do
    get_part("1")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for second part has proper number of treatises" do
    get_part("2")
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view for first part has proper first treatise" do
    get_part("1")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "First treatise")
  end

  test "view for first part has proper second treatise" do
    get_part("1")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Second treatise")
  end

  test "view for second part has proper first treatise" do
    get_part("2")
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "Third treatise")
  end

  test "view for second part has proper second treatise" do
    get_part("2")
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "Fourth treatise")
  end

  test "view for first part has proper link to first treatise" do
    get_part("1")
    assert_select("a[href=?]", "/treatises/1")
  end

  test "view for first part has proper link to second treatise" do
    get_part("1")
    assert_select("a[href=?]", "/treatises/2")
  end

  test "view for second part has proper link to first treatise" do
    get_part("2")
    assert_select("a[href=?]", "/treatises/3")
  end

  test "view for second part has proper link to second treatise" do
    get_part("2")
    assert_select("a[href=?]", "/treatises/4")
  end
end
