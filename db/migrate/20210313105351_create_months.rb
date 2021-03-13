class CreateMonths < ActiveRecord::Migration[6.1]
  def change
    create_table :months do |t|
      t.string :title
      t.string :description
      t.datetime :start_date

      t.timestamps
    end
  end
end
