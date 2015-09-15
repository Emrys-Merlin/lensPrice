require_relative "../objectiveSites.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_objective_name
    ObjectiveSites.objective("Test")
    ObjectiveSites.each do |obj|
      assert_equal(obj.to_s, "Test")
      assert_equal(obj.name, "Test")
      assert_equal(obj.url, nil)
    end
  end

  def test_objective_url
    ObjectiveSites.objective("Test", :url => "blubb")
    assert_equal(ObjectiveSites.last.url, "blubb")
    assert_equal(ObjectiveSites.last.name, "Test")
  end

end
