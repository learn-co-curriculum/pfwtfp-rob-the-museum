class Artist
  @@data = {}

  attr_reader :name, :works

  def self.all
    @@data
  end

  def self.find_or_create_by_name(name)
    return @@data[name] if @@data.has_key?(name)
    x = self.new(name)
    @@data[name] = x
  end

  def self.most_valuable
    @@data.max_by{ |k, a| a.portfolio_value }.last
  end

  def self.most_prolific
    @@data.max_by{ |k,a| a.works.length }.last
  end

  def self.find_by_name(name)
    @@data[name]
  end

  def initialize(name)
    @name = name
    @works = []
  end

  def to_s
    @name
  end

  def add_work(w)
    @works << w
  end

  def portfolio_value
    @works.map(&:value).map(&:to_i).reduce(&:+)
  end
end
