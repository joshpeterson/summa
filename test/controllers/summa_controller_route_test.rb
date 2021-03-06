# frozen_string_literal: true

require 'test_helper'

class SummaControllerRouteTest < ActionController::TestCase
  def setup
    @controller = SummaController.new
  end

  test 'routes browse to summa controller show action' do
    assert_recognizes({ controller: 'summa', action: 'show' },
                      '/browse')
  end
end
