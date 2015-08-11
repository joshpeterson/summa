require 'test_helper'

class SummaControllerViewTest < ActionController::TestCase
  def setup
    @controller = SummaController.new
    get(:index)
    @lists = css_select("div.list")
    @items = css_select(@lists[0], "a.item")
  end

  test "view has the proper title" do
    assert_select("title", "Summa Explorer")
  end

  test "view has proper header" do
    assert_select("div.title", "Summa Theologica - Saint Thomas Aquinas")
  end

  test "view has proper number of parts" do
    assert_equal(1, @lists.count, "Wrong number of lists found.")
    assert_equal(2, @items.count, "Wrong number of items found.")
  end

  test "view has proper first part" do
    a = css_select(@items[0], "a").first
    assert_match("FIRST PART", a.inner_html)
  end

  test "view has proper second part" do
    a = css_select(@items[1], "a").first
    assert_match("SECOND PART", a.inner_html)
  end

  test "view has proper link to first part" do
    assert_select("a[href=?]", "/parts/1")
  end

  test "view has proper link to second part" do
    assert_select("a[href=?]", "/parts/2")
  end
end
