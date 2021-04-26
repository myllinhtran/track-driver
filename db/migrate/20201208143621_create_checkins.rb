class CreateCheckins < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      t.references :driver, foreign_key: true
      t.integer :hours

      t.timestamps
    end
  end
end
