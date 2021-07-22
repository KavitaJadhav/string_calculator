class NegativeValueError < ArgumentError
  def initialize(values)
    super("negatives not allowed: #{values.join(',')}")
  end
end
