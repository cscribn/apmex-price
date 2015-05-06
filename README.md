# apmex-price
Get gold/silver spot, buy, and sell prices using apmex.com.

This program takes a CSV file, with header row, as input.  The column values should be the APMEX URL of the precious metal, the ounces of metal, and whether the metal is gold or silver.  The program will output CSV lines whose values are the APMEX URL of the precious metal, the ounces of metal, whether the metal is gold or silver, your sell price, the APMEX spot price, the APMEX buy price, and the APMEX sell price.  Your sell price is either the APMEX buy price, or the spot price if the buy price is not available.  This program relies on CSS paths of the apmex.com website, and will therefore need to be updated whenever the site design changes.

# Usage
<pre>ruby apmex-price.rb &lt;input_file&gt;</pre>

# Example Input File
<pre>
URL,Ounces,Metal
http://www.apmex.com/product/3/1-4-oz-gold-american-eagle-random-year,0.25,Gold
http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year,1,Silver
</pre>

# Example Output
<pre>
URL,Ounces,Metal,Sell Price,APMEX Spot Price,APMEX Buy Price,APMEX Sell Price
http://www.apmex.com/product/3/1-4-oz-gold-american-eagle-random-year,0.25,Gold,310.05,298.125,310.05,331.47
http://www.apmex.com/product/23331/1-oz-silver-american-eagle-random-year,1,Silver,16.48,16.48,0.0,20.17
</pre>
