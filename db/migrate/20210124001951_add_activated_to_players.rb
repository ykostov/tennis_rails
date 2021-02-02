class AddActivatedToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :activated, :boolean
  end
end
