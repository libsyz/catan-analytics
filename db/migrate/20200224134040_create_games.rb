
class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.string 'dice_rolls', array: true
    end
  end
end
