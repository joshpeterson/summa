# frozen_string_literal: true

require 'test_helper'

class SummaControllerTest < ActionController::TestCase
  def setup
    @summa = @controller.summa
    @titles = @summa.parts.collect(&:title)
  end

  test 'should get index' do
    get(:show)
    assert_response(:success)
  end

  test 'should return summa with proper number of parts' do
    assert_equal(2, @summa.parts.count)
  end

  test 'should return summa with proper first part' do
    assert_includes(@titles, 'FIRST PART')
  end

  test 'should return summa with proper second part' do
    assert_includes(@titles, 'SECOND PART')
  end
end
