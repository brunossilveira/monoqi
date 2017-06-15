class PricingRule
  attr_reader :unit_price, :special

  def initialize(unit_price, special = nil)
    @unit_price = unit_price
    @special = special || NoSpecial.new(total_price: unit_price)
  end

  def price_for(amount)
    special_price_for(amount) +
      normal_price_for(amount)
  end

  private

  def special_price_for(amount)
    specialed_items = (amount / special.amount).floor

    specialed_items * special.total_price
  end

  def normal_price_for(amount)
    unspecialed_items = amount % special.amount

    unspecialed_items * unit_price
  end
end

