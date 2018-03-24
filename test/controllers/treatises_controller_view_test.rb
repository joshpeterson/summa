# frozen_string_literal: true

require 'test_helper'

class TreatisesControllerViewTest < ActionController::TestCase
  def setup
    @controller = TreatisesController.new
  end

  def get_treatise(number)
    get(:show, id: number)
    @lists = css_select('div.list')
    @items = css_select(@lists[0], 'a.item')
  end

  test 'view has the proper title' do
    get_treatise('1')
    assert_select('title', 'First treatise - Summa Explorer')
  end

  test 'view has proper header' do
    get_treatise('1')
    assert_select('div.title', 'First treatise')
  end

  test 'view with a prologue has proper prologue' do
    get_treatise('1')
    assert_select('div.prologue', 'Prologue for first treatise')
  end

  test 'view without a prologue does not have a prologue' do
    get_treatise('2')
    assert_select('div.prologue', false, 'This treatise does not have a prologue')
  end

  test 'view for first treatise has proper number of questions' do
    get_treatise('1')
    assert_equal(1, @lists.count, 'Wrong number of lists found.')
    assert_equal(2, @items.count, 'Wrong number of items found.')
  end

  test 'view for second treatise has proper number of questions' do
    get_treatise('2')
    assert_equal(1, @lists.count, 'Wrong number of lists found.')
    assert_equal(2, @items.count, 'Wrong number of items found.')
  end

  test 'view for first treatise has proper first question' do
    get_treatise('1')
    a = css_select(@items[0], 'a').first
    assert_match('First question', a.inner_html)
  end

  test 'view for first treatise has proper second question' do
    get_treatise('1')
    a = css_select(@items[1], 'a').first
    assert_match('Second question', a.inner_html)
  end

  test 'view for second treatise has proper first question' do
    get_treatise('2')
    a = css_select(@items[0], 'a').first
    assert_match('Third question', a.inner_html)
  end

  test 'view for second treatise has proper second question' do
    get_treatise('2')
    a = css_select(@items[1], 'a').first
    assert_match('Fourth question', a.inner_html)
  end

  test 'view for first treatise has proper link to first question' do
    get_treatise('1')
    assert_select('a[href=?]', '/questions/1')
  end

  test 'view for first treatise has proper link to second question' do
    get_treatise('1')
    assert_select('a[href=?]', '/questions/2')
  end

  test 'view for second treatise has proper link to first question' do
    get_treatise('2')
    assert_select('a[href=?]', '/questions/3')
  end

  test 'view for second treatise has proper link to second question' do
    get_treatise('2')
    assert_select('a[href=?]', '/questions/4')
  end
end
