require_relative '../views/games_view'

class GamesController
  def initialize
    @view = GamesView.new
  end
  def start_game
    @view.call
    @game = Game.new(date: Date.today, dice_rolls: Array.new)
    gather_dice
  end

  def analyze_game
    @games = Game.all
    puts "what game do you want to see results for?"
    Game.all.each_with_index {|g,i| p "id: #{g.id}. --  date: #{g.pretty_date}"}
    selection = gets.chomp.to_i
    Game.find(selection).dice_count
  end

  def hall_of_fame
    games = Game.all
    victories = games.group_by { |game| game.winner }
    victories.transform_values!(&:count)
    @view.hall_of_fame(victories.sort_by { |k, v| -v })
  end

  private

  def gather_dice
    input = nil

    while input != "quit"
      input = @view.ask_for_roll
      @game.dice_rolls << input.to_i unless input == 'quit'
    end

    @view.finish_game(@game.dice_rolls.count)
    @game.save
  end

end
