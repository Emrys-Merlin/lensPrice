module Default
  extend self

  @path = nil
  @to = nil
  @from = nil
  @subject = nil
  @opening = nil
  @closing = nil
  @server = nil

  attr_accessor :path, :to, :from, :subject, :opening, :closing, :server

  def directory(dir)
    @path = dir
  end

  def mail(options)
    @to = options[:to]
    @from = options[:from]
    @subject = options[:subject]
    @opening = options[:opening]
    @closing = options[:closing]
    @server = options[:server]
  end

  def configure(&block)
    instance_eval(&block)
  end
  
end
