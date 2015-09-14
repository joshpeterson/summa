require 'test_helper'

class OutlineControllerTest < ActionController::TestCase
  def setup
    @summa = @controller.get_summa
  end

  test "should get show" do
    get(:show)
    assert_response(:success)
  end

  test "should return summa with proper number of parts" do
    assert_equal(2, @summa.parts.count)
  end

end
