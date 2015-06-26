require 'rubygems'
require 'csv'
require 'nokogiri'
require 'open-uri'

APMEX_URL = 'http://www.apmex.com'
GOLD_CSS = 'table.table-spot-prices > tbody > tr:nth-child(1) > td:nth-child(2) > span'
SILVER_CSS = 'table.table-spot-prices > tbody > tr:nth-child(2) > td:nth-child(2) > span'
BUY_CSS = 'div.product-buy-price > h4 > a'
PRICE_CSS = 'table.table-volume-pricing > tbody > tr:nth-child(1) > td:nth-child(2)'

URL_COLUMN = 0
OUNCES_COLUMN = 1
METAL_COLUMN = 2
SELL_PRICE_COLUMN = 3
APMEX_SPOT_PRICE_COLUMN = 4
APMEX_BUY_PRICE_COLUMN = 5
APMEX_SELL_PRICE_COLUMN = 6

if ARGV.length != 1 then
  puts "Usage: ruby apmex-price.rb <input_file>"
	exit
end

puts 'URL,Ounces,Metal,Sell Price,APMEX Spot Price,APMEX Buy Price,APMEX Sell Price'
page = Nokogiri::HTML(open(APMEX_URL))

# Get gold spot
gold_spot_span = page.css(GOLD_CSS)
gold_spot_match = /(\d*,*\d+\.\d+)/.match(gold_spot_span.text)

if gold_spot_match != nil
	gold_spot = gold_spot_match[1].gsub(',', '').to_f
else
	gold_spot = 0.0
end

# Get silver spot
silver_spot_span = page.css(SILVER_CSS)
silver_spot_match = /(\d*,*\d+\.\d+)/.match(silver_spot_span.text)

if silver_spot_match != nil
	silver_spot = silver_spot_match[1].gsub(',', '').to_f
else
	silver_spot = 0.0
end

# Get prices
CSV.foreach(ARGV[0], :headers => true) do |row|
	if row[METAL_COLUMN] == 'Gold'
		row[APMEX_SPOT_PRICE_COLUMN] = gold_spot * row[OUNCES_COLUMN].to_f
	else
		row[APMEX_SPOT_PRICE_COLUMN] = silver_spot * row[OUNCES_COLUMN].to_f
	end
	
	row[SELL_PRICE_COLUMN] = row[APMEX_SPOT_PRICE_COLUMN]
	page = Nokogiri::HTML(open(row[URL_COLUMN]))
	
	# Get buy price
	buy_link = page.css(BUY_CSS)
	buy_match = /(\d*,*\d+\.\d+)/.match(buy_link.text)
	
	if buy_match != nil
		row[APMEX_BUY_PRICE_COLUMN] = buy_match[1].gsub(',', '').to_f
		row[SELL_PRICE_COLUMN] = row[APMEX_BUY_PRICE_COLUMN]
	else
		row[APMEX_BUY_PRICE_COLUMN] = 0.0
	end
	
	# Get sell price
	price_td = page.css(PRICE_CSS)
	price_match = /(\d*,*\d+\.\d+)/.match(price_td.text)
	
	if price_match != nil
		row[APMEX_SELL_PRICE_COLUMN] = price_match[1].gsub(',', '').to_f
	else
		row[APMEX_SELL_PRICE_COLUMN] = 0.0
	end
	
	puts row
end