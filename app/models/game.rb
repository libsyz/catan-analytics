require 'pry-byebug'
require 'terminal-table'
require 'pastel'

class Game < ActiveRecord::Base
  serialize :dice_rolls, Array

  def pastel
    Pastel.new
  end


  PROBS = {
   2=>0.027777777777777776,
   3=>0.05555555555555555,
   4=>0.08333333333333333,
   5=>0.1111111111111111,
   6=>0.1388888888888889,
   7=>0.16666666666666666,
   8=>0.1388888888888889,
   9=>0.1111111111111111,
   10=>0.08333333333333333,
   11=>0.05555555555555555,
   12=>0.027777777777777776
 }

  def observed_prob(rolls_for_num, total_rolls)
    (rolls_for_num.to_f / total_rolls).round(2)
  end

  def expected_prob(dice_number)
    PROBS[dice_number].round(2)
  end

  def dice_count
    rows = []

    dice_rolls.sort.tally.each do |tallied_number|

      tallied_number.concat([ expected_prob(tallied_number[0]),
                            observed_prob(tallied_number[1], dice_rolls.count) ])
      rows << tallied_number
    end

    rows << ["Total Throws",
              dice_rolls.count,
              pastel.decorate("Winner", :on_green, :dim),
              pastel.decorate(self.winner, :on_green, :dim)]

    table = Terminal::Table.new :title => "Catan Game Summary - #{pretty_date}",
                                :headings => ['Dice Roll', 'Frequency', 'Expected Probability', 'Observed Probability'],
                                :rows => rows
    puts table
  end

  def calculate_fit(event, dice_events)
    count = dice_events.count
    fit = (event[1].to_f / count) - PROBS[event[0]]
  end

  def pretty_date
    date.strftime('%a %d %b %Y')
  end

end
