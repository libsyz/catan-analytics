require 'pastel'
require_relative './config/application.rb'

@game_controller = GamesController.new
@pastel = Pastel.new
# Think about the problem
# and the flow

# welcome the user
# what do you want to do?
# Record a new game
# Run Stats on previous games
# Close
def print_welcome
  string = <<~EOF
  **************************
  Welcome to Catan Analytics
  **************************
  EOF

  puts @pastel.decorate(string, :cyan, :bold)
end

def show_options
  puts "1 - Record a new game"
  puts "2 - Analyze a past game"
end

print_welcome
quit = false

while quit == false
  show_options
  input = gets.chomp
  case input
    when "1"
      @game_controller.start_game
    when "2"
      @game_controller.analyze_game
    when "q"
      quit = true
    else
      puts @pastel.decorate("Sorry, I did not get that.", :white, :on_red)
  end
end













