Gem::Specification.new do |s|
  s.name        = 'apmex-price'
  s.version     = '1.0.1'
  s.date        = '2015-12-07'
  s.summary     = 'Get spot, buy, sell, and value prices of precious metals using apmex.com URLs.'
  s.description = 'Do you own precious metals? Are you interested in getting the current value of your collection? If so, this gem is for you. Simply find the URL of a product you are interested in, pass it as an argument, and you will get back the spot, buy, sell, and value price. The value is either the APMEX buy price or the spot price if the buy price is not available. This program relies on CSS paths of the apmex.com website, and will therefore need to be updated whenever the site design changes.'
  s.authors     = ['cscribn']
  s.files       = ['lib/apmex-price.rb', 'test/test-apmex-price.rb']
  s.homepage    =
    'http://rubygems.org/gems/apmex-price'
  s.license       = 'MIT'
	s.add_development_dependency 'minitest', '~> 0'
	s.add_runtime_dependency 'nokogiri', '~> 0'
end