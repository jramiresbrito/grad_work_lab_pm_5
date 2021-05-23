require_relative '../interfaces/payable'
require_relative '../interfaces/levelable'
require_relative '../interfaces/csvable'

class Employee
  include LEVELABLE
  include PAYABLE
  include CSVABLE

  attr_reader :name
  attr_accessor :id

  def initialize(attrs = {})
    @id = attrs[:id]
    @name = attrs[:name].capitalize
  end

  def pay
    base_salary + erase_bonus
  end

  def bonus
    (bonus_modifier * (base_salary * bonus_modifier_value)).ceil
  end

  def self.headers
    %w[id name ocupation bonus_modifier]
  end
end
