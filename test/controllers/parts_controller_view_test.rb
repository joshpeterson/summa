require 'test_helper'

class PartsControllerViewTest < ActionController::TestCase
  def setup
    @controller = PartsController.new
  end

  def get_part(number)
    get(:show, :id => number)
    @itemsts = css_select("div.list")
    @items = css_select(@itemsts[0], "a.item")
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
    assert_equal(1, @itemsts.count, "Wrong number of unordered itemsts found.")
    assert_equal(2, @items.count, "Wrong number of itemst items found.")
  end

  test "view for second part has proper number of treatises" do
    get_part("2")
    assert_equal(1, @itemsts.count, "Wrong number of unordered itemsts found.")
    assert_equal(2, @items.count, "Wrong number of itemst items found.")
  end

  test "view for first part has proper first treatise" do
    get_part("1")
    a = css_select(@items[0], "a").first
    assert_match("First treatise", a.inner_html)
  end

  test "view for first part has proper second treatise" do
    get_part("1")
    a = css_select(@items[1], "a").first
    assert_match("Second treatise", a.inner_html)
  end

  test "view for second part has proper first treatise" do
    get_part("2")
    a = css_select(@items[0], "a").first
    assert_match("Third treatise", a.inner_html)
  end

  test "view for second part has proper second treatise" do
    get_part("2")
    a = css_select(@items[1], "a").first
    assert_match("Fourth treatise", a.inner_html)
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
