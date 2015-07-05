require 'test_helper'

class SummaControllerRouteTest < ActionController::TestCase
  def setup
    @controller = SummaController.new
  end

  test "root routes to summa controller show action" do
    assert_recognizes({:controller => 'summa', :action => 'index'}, '/')
  end
end
