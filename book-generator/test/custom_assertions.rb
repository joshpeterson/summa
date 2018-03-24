# frozen_string_literal: true

require 'minitest/assertions'

module Minitest
  module Assertions
    def assert_startswith(expected_start, actual, *args)
      assert_match(/^#{expected_start}/, actual, *args)
    end
  end
end
