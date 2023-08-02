require 'uri'
require 'net/http'

module LatestStockPrice
  BASE_URL = 'https://latest-stock-price.p.rapidapi.com/price'
  HEADERS = {
    'X-RapidAPI-Key' => 'cc49617478msh07ba19ae01233e9p103126jsn8b2f0cec9160',
    'X-RapidAPI-Host' => 'latest-stock-price.p.rapidapi.com',
    'Accept' => 'application/json'
  }

  def self.price(symbol)
    uri = URI("#{BASE_URL}?Indices=#{symbol}")
    response = make_request(uri)
    parse_response(response)
  end

  private

  def self.make_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri)
    HEADERS.each { |key, value| request[key] = value }

    http.request(request)
  end

  def self.parse_response(response)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      { 'error' => 'Something went wrong with the API request.' }
    end
  end
end
