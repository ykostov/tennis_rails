class AddPointsToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :points, :integer
  end
end
