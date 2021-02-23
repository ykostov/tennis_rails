class AddPointsToPlayersInTours < ActiveRecord::Migration[6.1]
  def change
    add_column :players_in_tours, :points, :integer
  end
end
