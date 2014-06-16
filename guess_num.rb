int = rand(10)
guess_count = 2

begin
puts "guess a number between 1 annd 10."
guess = gets.chomp

if int == guess.to_i
  puts "You got it"
  exit
end

raise ("Oops. Wrong.")

rescue RuntimeError => e
  puts e.class.name
  puts e.message
  exit if guess_count ==  0
  puts "You have #{guess_count} more guesses."
  guess_count -= 1


  retry
end
