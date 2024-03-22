require 'rest-client'
require 'json'

class CoinApiService
  BASE_URL = 'https://rest.coinapi.io/v1'.freeze

  def initialize(api_key)
    @api_key = api_key
  end

  def price_of(symbol)
    response = RestClient.get("#{BASE_URL}/exchangerate/#{symbol}/USD", headers)
    if response.code == 200
      JSON.parse(response.body)["rate"]
    else
      nil
    end
  end

  def calculate_annual_gain(initial_investment, monthly_return_rate)
    months = 12
    (initial_investment * (1 + monthly_return_rate.to_f / 100) ** months) - initial_investment
  end

  def projected_balance(initial_investment, monthly_return_rate)
    months = 12
    initial_investment * (1 + monthly_return_rate.to_f / 100) ** months
  end

  private

  def headers
    { "X-CoinAPI-Key" => @api_key }
  end
end
