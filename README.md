# apmex-price
Get spot, buy, sell, and value prices of precious metals using apmex.com URLs.

Do you own precious metals?  Are you interested in getting the current value of your collection?  If so, this gem is for you.  Simply find the URL of a product you are interested in, pass it as an argument, and you will get back the spot, buy, sell, and value price.  The value is either the APMEX buy price or the spot price if the buy price is not available.  This program relies on CSS paths of the apmex.com website, and will therefore need to be updated whenever the site design changes.

# Installation
```ruby
gem install apmex-price
```

# Usage
```ruby
require 'apmex-price'

url = 'http://www.apmex.com/product/3/1-4-oz-gold-american-eagle-random-year'
a = ApmexPrice.new(url)
puts 'Value: ' + a.current_value..to_s
puts 'Spot: ' + a.ounces_spot.to_s
puts 'Buy: ' + a.buy.to_s
puts 'Sell: ' + a.sell.to_s
```
