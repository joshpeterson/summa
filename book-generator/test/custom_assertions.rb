require 'minitest/assertions'

module Minitest::Assertions
  def assert_startswith(expected_start, actual, *args)
    assert_match(/^#{expected_start}/, actual, *args)
  end
end
