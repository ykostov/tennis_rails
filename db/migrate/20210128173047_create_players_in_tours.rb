class CreatePlayersInTours < ActiveRecord::Migration[6.1]
  def change
    create_table :players_in_tours do |t|
      t.references :player, null: false, foreign_key: true
      t.references :gladiator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
