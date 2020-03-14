
class GamesView
  def call
    puts "starting new game on #{Date.today}"
  end

  def finish_game(roll_count)
    puts "game finished at #{roll_count} rolls"
  end

  def ask_for_roll
    puts "enter the next roll - type 'quit' to exit"
    print ">"
    input = gets.chomp
  end

  def ask_for_winner
    puts "Game is over! Who won?"
    input = gets.chomp
  end

  def hall_of_fame(victories_arr)
    victories_arr.each do |pair|
      puts "#{pair[0]} - #{pair[1]} victories"
    end
  end
end
