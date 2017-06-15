class Special
  attr_reader :amount, :total_price

  def initialize(amount:, total_price:)
    @amount = amount
    @total_price = total_price
  end
end

class NoSpecial
  attr_reader :amount, :total_price

  def initialize(total_price:)
    @amount = 1
    @total_price = total_price
  end
end
