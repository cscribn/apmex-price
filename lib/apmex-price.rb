require 'nokogiri'
require 'open-uri'

class ApmexPrice
  attr_accessor :url, :page, :buy

  DOLLARS_REGEX = /(\d*,*\d+\.\d+)/
  BUY_CSS = 'div.page-content-main > div > div > strong'

	def initialize(url)
		@url = url
		match()
	end

  def match
		@page = Nokogiri::HTML(open(@url))
		@buy = match_dollars(BUY_CSS)
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
end