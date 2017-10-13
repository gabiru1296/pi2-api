class SensorError < ApplicationRecord
  belongs_to :sensor

  def description
    case self.error
    when 1
      return 'Error de placa'
    when 2
      return 'Error de motor'
    when 3
      return 'Error de Roda'
    else
      return 'Error não cadastrado na lista de errors'
    end
  end
end
