require 'minitest/autorun'
require_relative '../lib/apmex-price'

class ApmexPriceTest < Minitest::Test
	def test_
		apmex_urls = [
			'http://www.apmex.com/product/3/1-4-oz-gold-american-eagle-random-year',
			'http://www.apmex.com/product/1/1-oz-gold-american-eagle-random-year',
			'http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year',
			'http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year',
			'http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year',
			'http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year',
			'http://www.apmex.com/product/54875/2010-australia-1-oz-silver-kookaburra-bu',
			'http://www.apmex.com/product/54875/2010-australia-1-oz-silver-kookaburra-bu',
			'http://www.apmex.com/product/84445/2015-australia-1-oz-silver-kookaburra-bu',
			'http://www.apmex.com/product/4233/austria-1-10-oz-gold-philharmonic-bu-random-year',
			'http://www.apmex.com/product/55369/austria-1-oz-silver-philharmonic-random-year',
			'http://www.apmex.com/product/79573/2014-1-oz-silver-britannia-brilliant-uncirculated',
			'http://www.apmex.com/product/12/1-10-oz-gold-canadian-maple-leaf-random-year',
			'http://www.apmex.com/product/11/canada-1-4-oz-gold-maple-leaf-random-year',
			'http://www.apmex.com/product/1090/1-oz-silver-canadian-maple-leaf-random-year',
			'http://www.apmex.com/product/26849/china-1-10-oz-gold-panda-bu-random-year-sealed-in-plastic',
			'http://www.apmex.com/product/72458/2013-china-1-oz-silver-panda-bu-in-capsule',
			'http://www.apmex.com/product/1114/1-oz-silver-mexican-libertad-random-year',
			'http://www.apmex.com/product/11951/1-oz-pamp-suisse-gold-bar-9999-fine-in-assay',
			'http://www.apmex.com/product/57159/1-oz-perth-mint-gold-bar-9999-fine-in-assay',
			'http://www.apmex.com/product/21/10-oz-silver-bar-secondary-market-999-fine',
			'http://www.apmex.com/product/72281/10-oz-sunshine-silver-bar-999-fine-v2',
			'http://www.apmex.com/product/72281/10-oz-sunshine-silver-bar-999-fine-v2'
		]

		puts 'Value,Spot,Buy,Sell'

		apmex_urls.each do |u|
			a = ApmexPrice.new(u)
			puts a.to_s
			assert a.value.is_a? Float
			assert a.ounces_spot.is_a? Float
			assert a.buy.is_a? Float
			assert a.sell.is_a? Float
		end
	end
end