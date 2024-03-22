
class InvestmentCalculator
  def initialize(api_key)
    @service = CoinApiService.new(api_key)
    @last_request_time = nil
  end

  def calculate(inversion_inicial)
    {
      btc: calculate_for_currency('BTC', inversion_inicial, 5.0),
      eth: calculate_for_currency('ETH', inversion_inicial, 4.2),
      ada: calculate_for_currency('ADA', inversion_inicial, 1.1)
    }
  end

  private

  def calculate_for_currency(symbol, inversion_inicial, retorno, lazy = false)
    if lazy
      current_time = Time.now
      if @last_request_time && current_time - @last_request_time < 1
        sleep(1 - (current_time - @last_request_time))
      end
      @last_request_time = Time.now
    end
    price = @service.price_of(symbol)
    unidades = inversion_inicial / price
    valor_final = unidades * price * (1 + retorno / 100) ** 12
    ganancia = valor_final - inversion_inicial
    { price: price, unidades: unidades, valor_final: valor_final, ganancia: ganancia }
  end
end
