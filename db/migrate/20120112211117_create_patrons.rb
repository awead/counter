class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :barcode
      t.integer :count, :default => 1
      t.timestamps
    end
  end
end
