require 'nokogiri'
require 'open-uri'

def blockchain

  symbol = []
  price = []
  hash_blockchain = {}

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  puts page.class


page.search('td.text-left.col-symbol').each do |link|
  symbol << link.content
rescue => e
  puts "Oups petite erreur, mais c'est pas grave"
end

page.css('a[class=price]').each do |link|
  price << link.content.gsub(/["$"]/, '')
rescue => e
  puts "Oups petite erreur, mais c'est pas grave"
end

hash_blockchain = [symbol.zip(price)]

return hash_blockchain
end

print blockchain
