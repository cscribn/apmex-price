require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ApmexPrice
	attr_accessor :url, :page, :spot, :ounces_spot, :buy, :sell, :current_value
	
	DOLLARS_REGEX = /(\d*,*\d+\.\d+)/
	OUNCES_REGEX = /(\d*,*\d+\.?\d*)/
	OUNCES_CSS = 'div.product-specs > table > tbody > tr:nth-child(7) > td'
	SPOT_CSS = 'span.item-bid'
	BUY_CSS = 'div.product-buy-price > h4 > a'
	SELL_CSS = 'table.table-volume-pricing > tbody > tr:nth-child(1) > td:nth-child(2)'

	def initialize(url)
		@url = url
		match()
		calculate()
	end
	
	def match
		@page = Nokogiri::HTML(open(@url))
		
		# Get ounces
		ounces_text = @page.css(OUNCES_CSS).text
		ounces_match = OUNCES_REGEX.match(ounces_text)
		@ounces = ounces_match[0].to_f
		
		# Get the dollar amounts
		@spot = match_dollars(SPOT_CSS)
		@buy = match_dollars(BUY_CSS)
		@sell = match_dollars(SELL_CSS)
	end
	
	def calculate
		@ounces_spot = @spot * @ounces
		
		if @buy != 0.0
			@current_value = @buy
		else
			@current_value = @ounces_spot
		end
	end
	
	def match_dollars(dollars_css)
		dollars_text = @page.css(dollars_css).text
		dollars_match = DOLLARS_REGEX.match(dollars_text)
		
		if dollars_match != nil
			dollars_match[1].gsub(',', '').to_f
		else
			0.0
		end			
	end
	
	def to_s
		@current_value.to_s + ',' + @spot.to_s + ',' + @buy.to_s + ',' + @sell.to_s
	end	
end