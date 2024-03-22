require 'csv'

class CsvGenerator
  def self.generate(data)
    CSV.generate(headers: true) do |csv|
      csv << ['Criptomoneda', 'Precio Actual', 'Unidades Compradas', 'Valor Final Proyectado', 'Ganancia']
      data.each do |symbol, values|
        csv << [symbol, values[:price], values[:unidades], values[:valor_final], values[:ganancia]]
      end
    end
  end
end
