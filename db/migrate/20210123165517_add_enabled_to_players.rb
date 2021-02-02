class AddEnabledToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :enabled, :boolean
  end
end
