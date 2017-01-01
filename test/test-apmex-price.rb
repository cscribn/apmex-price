require 'minitest/autorun'
require_relative '../lib/apmex-price'

class ApmexPriceTest < Minitest::Test
	def test_
		apmex_urls = [
            'http://www.apmex.com/sell-to-us/3',
            'http://www.apmex.com/sell-to-us/59146',
            'http://www.apmex.com/sell-to-us/12082',
            'http://www.apmex.com/sell-to-us/57010',
            'http://www.apmex.com/sell-to-us/59157',
            'http://www.apmex.com/sell-to-us/79019',
            'http://www.apmex.com/sell-to-us/92698',
            'http://www.apmex.com/sell-to-us/54875',
            'http://www.apmex.com/sell-to-us/54875',
            'http://www.apmex.com/sell-to-us/84445',
            'http://www.apmex.com/sell-to-us/79047',
            'http://www.apmex.com/sell-to-us/79021',
            'http://www.apmex.com/sell-to-us/71264',
            'http://www.apmex.com/sell-to-us/79041',
            'http://www.apmex.com/sell-to-us/56011',
            'http://www.apmex.com/sell-to-us/93757',
            'http://www.apmex.com/sell-to-us/72454',
            'http://www.apmex.com/sell-to-us/72458',
            'http://www.apmex.com/sell-to-us/79573',
            'http://www.apmex.com/sell-to-us/69514',
            'http://www.apmex.com/sell-to-us/87944',
            'http://www.apmex.com/sell-to-us/11951',
            'http://www.apmex.com/sell-to-us/57159',
            'http://www.apmex.com/sell-to-us/92390',
            'http://www.apmex.com/sell-to-us/43309',
            'http://www.apmex.com/sell-to-us/72281',
            'http://www.apmex.com/sell-to-us/72281'
		]

		apmex_urls.each do |u|
			a = ApmexPrice.new(u)
			puts a.buy.to_s
			assert a.buy.is_a? Float
		end
	end
end