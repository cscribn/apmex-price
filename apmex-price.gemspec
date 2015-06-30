Gem::Specification.new do |s|
  s.name        = 'apmex-price'
  s.version     = '0.1.1'
  s.date        = '2015-06-30'
  s.summary     = 'Get spot, buy, sell, and current value prices of precious metals using apmex.com URLs.'
  s.description = 'Do you own precious metals? Are you interested in getting the current value of your collection? If so, this gem is for you. Simply find the URL of a product you are interested in, pass it as an argument, and you will get back the spot, buy, sell, and current value price. The current price is either the APMEX buy price or the spot price if the buy price is not available. This program relies on CSS paths of the apmex.com website, and will therefore need to be updated whenever the site design changes.'
  s.authors     = ['cscribn']
  s.files       = ['lib/apmex-price.rb', 'test/test-apmex-price.rb']
  s.homepage    =
    'http://rubygems.org/gems/apmex-price'
  s.license       = 'MIT'
end