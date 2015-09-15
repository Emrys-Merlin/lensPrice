require_relative "../default.rb"
require "test/unit"

class TestDefault < Test::Unit::TestCase

  def setup
    @to = "a1"
    @from = "b2"
    @subject = "c3"
    @opening = "d4"
    @closing = "e5"
    @server = "f6"
  end
  
  def test_path
    Default.directory "Test"
    assert_match(Default.path, "Test")
  end

  def test_mail
    Default.mail :to => @to,
                 :from => @from,
                 :subject => @subject,
                 :opening => @opening,
                 :closing => @closing,
                 :server => @server

    assert_match(Default.to, @to)
    assert_match(Default.from, @from)
    assert_match(Default.subject, @subject)
    assert_match(Default.opening, @opening)
    assert_match(Default.closing, @closing)
    assert_match(Default.server, @server)
  end

end
