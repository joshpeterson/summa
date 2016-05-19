gem "minitest"
require "minitest/autorun"
require_relative "../generator/summary_generator"
require_relative "custom_assertions.rb"

class TestSummaryGenerator < Minitest::Test
  def setup
    @generator = SummaryGenerator.new()
  end

  def test_FirstLineIsSummaryTag
    summary = @generator.Write
    assert_startswith("# Summary", summary)
  end
end
