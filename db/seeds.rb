# This is where you can create initial data for your app.
games = [
{
  date: Date.new(2020, 2, 15),
  dice: [8,5,3,12,7,4,4,5,6,9,11,9,5,5,12,4,4,5,7,3,6,7,9,9,10,10,6,7,7,5,5,10,8,8,7,9,10,9,12,10,5,8],
  winner: "Tiny"
},
{
  date: Date.new(2020, 2, 21),
  dice: [6,2,7,9,2,3,9,10,6,5,5,8,6,10,7,7,8,2,5,6,9,6,7,5,2,5,2,4,9,6,9,6,6,7,6,9,7,6,7,9],
  winner: "Tiny"
},
{
  date: Date.new(2020, 2, 22),
  dice: [10,9,6,11,6,7,4,6,7,11,10,12,2,12,8,7,6,6,10,4,9,8,8,7,7,9,6,9,6,6,5,4,8,7,3,6,6,6,5,9,2,7,12,5,5,6,5,9,5,8,8],
  winner: "Miguel"
}

]


games.each do |game|
  Game.create(date: game[:date],
           dice_rolls: game[:dice],
           winner: game[:winner])
end

