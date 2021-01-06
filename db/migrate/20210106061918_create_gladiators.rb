class CreateGladiators < ActiveRecord::Migration[6.1]
  def change
    create_table :gladiators do |t|
      t.string :title
      t.datetime :start_date
      t.text :info
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
