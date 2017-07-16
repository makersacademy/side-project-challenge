class Listicle
  attr_reader :prefixes, :suffixes

  def self.create
    @listicle = Listicle.new
  end

  def initialize(prefixes = Prefix.all, suffixes = Suffix.all)
    @prefixes = prefixes
    @suffixes = suffixes
  end

  def generate(num = rand(2..50))
    { title: construct_string(num) }
  end

  private
  def construct_string(num)
    "#{get_content(prefixes)} #{get_content(suffixes)}".
    gsub("_number_", num.to_s)
  end

  def get_content(text)
    text.sample.content
  end
end
