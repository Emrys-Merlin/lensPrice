require_relative "../lensSites.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_lens_name
    LensSites.lens("Test")
    LensSites.each do |obj|
      assert_equal(obj.to_s, "Test")
      assert_equal(obj.name, "Test")
      assert_equal(obj.url, nil)
    end
    LensSites.lens("abc/de")
    assert_equal(LensSites.last.name, "abc-de")
  end

  def test_lens_url
    LensSites.lens("Test", :url => "blubb")
    assert_equal(LensSites.last.url, "blubb")
    assert_equal(LensSites.last.name, "Test")
  end

end
