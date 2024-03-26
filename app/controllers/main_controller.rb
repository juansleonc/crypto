# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!
  before_action :load_coins, only: [:index]

  DEFAULT_INVESTMENT_AMOUNT = 1000

  def index; end

  def download_investment_summary
    results = calculate_investment(investment_amount_from_params)
    csv_data = CsvGenerator.generate(results)
    send_data csv_data, filename: "resumen-inversion-criptomonedas-#{Date.today}.csv"
  end

  private

  def load_coins
    @results = calculate_investment(investment_amount_from_params)
  end

  def calculate_investment(amount)
    calculator = InvestmentCalculator.new(ENV['KEY2'])
    calculator.calculate(amount)
  end

  def investment_amount_from_params
    params.fetch(:inversion_total, DEFAULT_INVESTMENT_AMOUNT).to_i
  end
end
