module ObjectiveSites

  extend self

  def configure(&block)
    instance_eval(&block)
  end

  def definitions
    @definitions ||= Array.new
  end


  def objective(name, options={})
    definitions.push(Objective.new(name, options))
  end

  def list
    definitions.each do |objective|
      puts objective.to_s
    end
  end

  def each
    definitions.each do |objective|
      yield objective
    end
  end

  def last
    definitions.last
  end

  class Objective
    def initialize(name, options)
      @name = name
      @url = options[:url]
      @focus = options[:focus]
      @vendor = options[:vendor]
      @aperture = options[:aperture]
    end

    attr_reader :name, :url, :focus, :vendor, :aperture

    def to_s
      @name
    end
  end
end
