require 'test_helper'

class SummaControllerViewTest < ActionController::TestCase
  def setup
    @controller = SummaController.new
    get(:index)
    @uls = css_select("ul")
    @lis = css_select(@uls[0], "li")
  end

  test "view has the proper title" do
    assert_select("title", "Summa Explorer")
  end

  test "view has proper header" do
    assert_select("div.title", "Summa Theologica - Saint Thomas Aquinas")
  end

  test "view has proper number of parts" do
    assert_equal(1, @uls.count, "Wrong number of unordered lists found.")
    assert_equal(2, @lis.count, "Wrong number of list items found.")
  end

  test "view has proper first part" do
    a = css_select(@lis[0], "a").first
    assert_equal(a.inner_html, "FIRST PART")
  end

  test "view has proper second part" do
    a = css_select(@lis[1], "a").first
    assert_equal(a.inner_html, "SECOND PART")
  end

  test "view has proper link to first part" do
    assert_select("a[href=?]", "/parts/1")
  end

  test "view has proper link to second part" do
    assert_select("a[href=?]", "/parts/2")
  end
end
