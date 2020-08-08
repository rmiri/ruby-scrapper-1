require 'nokogiri'
require 'httparty'
require 'byebug'

def scrapper
    url = 'http://books.toscrape.com/'
    unparsedPage = HTTParty.get(url)
    parsedPage = Nokogiri::HTML(unparsedPage)
    products = parsedPage.css('article.product_pod')

    prodArray = Array.new

    products.each do |prod|
        product = {
            name: prod.css('a')[1].attributes["title"].value
        }
    prodArray << product
    end
end



scrapper

