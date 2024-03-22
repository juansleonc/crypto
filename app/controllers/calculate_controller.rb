# frozen_string_literal: true

class CalculateController < ApplicationController
  def create
    calculator = InvestmentCalculator.new(ENV['KEY2'])
    @results = calculator.calculate(params[:inversion_total].to_f)

    respond_to(&:turbo_stream)
  end
end
