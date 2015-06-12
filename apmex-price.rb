require 'rubygems'
require 'csv'
require 'nokogiri'
require 'open-uri'

APMEX_URL = 'http://www.apmex.com'
GOLD_CSS = 'table.table-spot-prices > tbody > tr:nth-child(1) > td:nth-child(2) > span'
SILVER_CSS = 'table.table-spot-prices > tbody > tr:nth-child(2) > td:nth-child(2) > span'
BUY_CSS = 'div.product-buy-price > h4 > a'
PRICE_CSS = 'table.table-volume-pricing > tbody > tr:nth-child(1) > td:nth-child(2)'

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
	if row[2] == 'Gold'
		row[4] = gold_spot * row[1].to_f
	else
		row[4] = silver_spot * row[1].to_f
	end
	
	row[3] = row[4]
	page = Nokogiri::HTML(open(row[0]))
	
	# Get buy price
	buy_link = page.css(BUY_CSS)
	buy_match = /(\d*,*\d+\.\d+)/.match(buy_link.text)
	
	if buy_match != nil
		row[5] = buy_match[1].gsub(',', '').to_f
		row[3] = row[5]
	else
		row[5] = 0.0
	end
	
	# Get sell price
	price_td = page.css(PRICE_CSS)
	price_match = /(\d*,*\d+\.\d+)/.match(price_td.text)
	
	if price_match != nil
		row[6] = price_match[1].gsub(',', '').to_f
	else
		row[6] = 0.0
	end
	
	puts row
end