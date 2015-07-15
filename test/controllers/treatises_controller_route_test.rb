require 'test_helper'

class TreatisesControllerRouteTest < ActionController::TestCase
  def setup
    @controller = TreatisesController.new
  end

  test "routes the treatise id to the show action" do
    assert_recognizes({:controller => "treatises", :action => "show", :id => "1"},
                      "/treatises/1")
  end
end
