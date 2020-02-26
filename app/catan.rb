  require 'pry-byebug'
  require 'terminal-table'

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

def dice_count(dice_events)
  rows = []
  dice_events.sort.tally.each do |el|
    el.concat([ expected_prob(el[0]),
                observed_prob(el[1], dice_events.count) ])
    rows << el
  end
  rows << ["Total Throws", dice_events.count]
  table = Terminal::Table.new :title => "Catan Game Summary", :headings => ['Dice Roll', 'Frequency', 'Expected Probability', 'Observed Probability'], :rows => rows
  puts table
end

def calculate_fit(event, dice_events)
 count = dice_events.count
 fit = (event[1].to_f / count) - PROBS[event[0]]
end


dice_count(arr_two)
