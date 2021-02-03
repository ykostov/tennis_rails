class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.references :player, null: false, foreign_key: true
      t.references :gladiator, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
