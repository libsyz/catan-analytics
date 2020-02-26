
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
end
