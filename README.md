# apmex-price
Get buy price of precious metals using apmex.com URLs.

Do you own precious metals?  Are you interested in getting the current value of your collection?  If so, this gem is for you.  Simply find the URL of a product you are interested in, pass it as an argument, and you will get back the Apmex buy price.  This program relies on CSS paths of the apmex.com website, and will therefore need to be updated whenever the site design changes.

# Installation
```ruby
gem install apmex-price
```

# Usage
```ruby
require 'apmex-price'

url = 'http://www.apmex.com/product/3'
a = ApmexPrice.new(url)
puts 'Buy: ' + a.buy.to_s
```
