require 'nokogiri'
  require 'open-uri'



def url
  url = 'https://coinmarketcap.com/all/views/all/'
end

def crypto_names
  crypto_name = []
end

def crypto_prices
  crypto_price = []
end



def scraper_name(crypto_name)
  page = Nokogiri::HTML(URI.open(url))
  200.times do |count|
    page.css("tr.cmc-table-row:nth-child(#{count + 1}) > td:nth-child(3) > div:nth-child(1)").each do |symbole|
    crypto_name << symbole.text
    end 
  end
  return crypto_name
end



def scraper_price(crypto_price)
  page = Nokogiri::HTML(URI.open(url))
  200.times do |count|
    page.css("tr.cmc-table-row:nth-child(#{count + 1}) > td:nth-child(5) > div:nth-child(1) > a:nth-child(1)").each do |price|
    crypto_price << price.text
    end
  end
  return crypto_price
end



def crypto(crypto_name,crypto_price)
  value_crypto = crypto_name.zip(crypto_price).map{|x| [x].to_h}
  return value_crypto
end



def hello(value_crypto)
  print value_crypto
  puts
end



def perform
  url = url

  crypto_name = crypto_names
  crypto_price = crypto_prices
  
  scraper_name(crypto_name)
  scraper_price(crypto_price)

  value_crypto = crypto(crypto_name,crypto_price)

  crypto(crypto_name,crypto_price)

  hello(value_crypto)
end



perform