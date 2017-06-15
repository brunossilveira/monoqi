class Checkout
  attr_reader :rules, :items

  def initialize(rules)
    @rules = rules
    @items = Hash.new(0)
  end

  def scan(item)
    items[item] += 1
  end

  def total
    return 0 if items.empty?

    items.map do |item, amount|
      rule = rules[item]

      rule.price_for(amount)
    end.inject(:+)
  end
end

