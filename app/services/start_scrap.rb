  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'


class StartScrap

  attr_accessor :url

  def initialize
    @url = "https://coinmarketcap.com/all/views/all/"
  end

  def perform
    puts crypto
  end

  def save

  end

  private

  def crypto
    hash = {}
    list_names = []
    list_values = []
    doc = Nokogiri::HTML(open(@url))
    doc.xpath('//a[@class = "currency-name-container link-secondary"]').each do |node|
      list_names << node.text
    end
    doc.xpath('//a[@class = "price"]').each do |node|
      list_values << node.text
    end
  for i in (0..list_names.length-1) do
    hash[list_names[i]] = list_values[i]
  end
  return hash
end

end
