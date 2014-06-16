require_relative 'validation'

module MyCarApp
  class Car
    include MyCarApp
    attr_accessor :year, :model, :make

    MAKES = [:toyota, :ford, :gm]
    MODELS = {:ford => [:focus, :taurus, :mustang], :toyota => [:camry, :lexus, :corolla, :rav4], :gm =>[:corvette, :lumina, :nova]}
    def initialize()
      tries = 3
      begin
        puts "What is the make of the car?"
        @make = gets.chomp.downcase.to_sym
        validate_make
      rescue CarMakeError => e
        tries -= 1
        puts e.message
        retry if tries > 0
        exit
      end

      begin
        puts "What is the model?"
        @model = gets.chomp.downcase.to_sym
        validate_model
      rescue CarModelError => e
        tries -= 1
        puts e.message
        retry if tries > 0
        exit
      end

      begin
        puts "What is the year"
        @year = gets.chomp.to_i
        validate_year

      rescue CarYearError => e
        tries -=1
        puts e.message
        retry if tries > 0
        exit
      end

        puts "Yay you made a #{year} #{make} #{model}!"
        puts

        @id = rand(10_000_000)





    end
  end

  class CarModelError < StandardError
  end

  class CarMakeError < StandardError
  end

  class CarYearError <StandardError
  end

end
