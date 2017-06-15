# Checkout [![Code Climate](https://codeclimate.com/github/brunossilveira/monoqi.png)](https://codeclimate.com/github/brunossilveira/monoqi)

This is a checkout system that handles specials such as "one for 50, three for 130" defined by this [Code Kata](http://codekata.com/kata/kata09-back-to-the-checkout/)

# Usage

To use this application, you need to setup one `PricingRule` for each item on your inventory, like the example below:

```ruby
rules = {
  'A' => PricingRule.new(unit_price: 50, special: Special.new(amount: 3, total_price: 130)),
  'B' => PricingRule.new(unit_price: 80)
}
```

Then you can initialize a `Checkout` object with those rules and start scaning for items:

```ruby
checkout = Checkout(rules)
```

```ruby
checkout.scan('A')
```

```ruby
checkout.total # => 50
```

```ruby
checkout.scan('A')
```

```ruby
checkout.total # => 100
```

```ruby
checkout.scan('A')
```

```ruby
checkout.total # => 130
```

# Setup

` $ git clone https://github.com/brunossilveira/monoqi`

`$ bundle install`

# Tests

To run the tests, just run

` $ rspec `

# Console

You can play around by launching the console

`$ scripts/console`
