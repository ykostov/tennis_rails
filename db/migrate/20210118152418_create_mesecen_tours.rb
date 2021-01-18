class CreateMesecenTours < ActiveRecord::Migration[6.1]
  def change
    create_table :mesecen_tours do |t|
      t.string :title
      t.text :info
      t.datetime :start_date
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
