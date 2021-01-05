class CreateCompetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :date
      t.integer :time
      t.text :info
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
