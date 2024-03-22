# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    InvestmentCalculator.new(ENV['KEY2'])
    # @results = calculator.calculate(1000)
    @results = []
  end

  def download_investment_summary
    calculator = InvestmentCalculator.new(ENV['KEY2'])
    results = calculator.calculate(100_000)
    csv_data = CsvGenerator.generate(results)

    send_data csv_data, filename: "resumen-inversion-criptomonedas-#{Date.today}.csv"
  end
end
