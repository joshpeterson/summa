require 'test_helper'

class PartsControllerRouteTest < ActionController::TestCase
  def setup
    @controller = PartsController.new
  end

  test 'routes the part id to the show action' do
    assert_recognizes({ controller: 'parts', action: 'show',
                        id: '1' }, '/parts/1')
  end
end
