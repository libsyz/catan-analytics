class AddPropsToGames < ActiveRecord::Migration[4.2]
  def change
    add_column :games, :winner, :string
    add_column :games, :date, :datetime
  end
end
