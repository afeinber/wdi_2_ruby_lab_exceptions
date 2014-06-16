require_relative 'car'

module MyCarApp

  def validate_model
    raise CarModelError.new("#{model.to_s} is not a valid #{make.to_s} model") unless Car::MODELS[make].include?(model)
  end

  def validate_make
    raise CarMakeError.new("#{model.to_s} is not a valid model") unless Car::MAKES.include?(make)
  end

  def validate_year
    raise CarYearError.new("#{year} is not a valid year") unless year > 1960
  end

end
