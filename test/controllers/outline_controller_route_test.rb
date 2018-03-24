# frozen_string_literal: true

require 'test_helper'

class OutlineControllerRouteTest < ActionController::TestCase
  def setup
    @controller = OutlineController.new
  end

  test 'routes outline to outline controller show action' do
    assert_recognizes({ controller: 'outline', action: 'show' },
                      '/outline')
  end
end
