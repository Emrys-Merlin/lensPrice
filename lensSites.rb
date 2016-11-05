module LensSites

  extend self

  def configure(&block)
    instance_eval(&block)
  end

  def definitions
    @definitions ||= Array.new
  end


  def lens(name, options={})
    definitions.push(Lens.new(name, options))
  end

  def list
    definitions.each do |lens|
      puts lens.to_s
    end
  end

  def each
    definitions.each do |lens|
      yield lens
    end
  end

  def last
    definitions.last
  end

  class Lens
    def initialize(name, options)
      @name = name.gsub("/","-")
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
