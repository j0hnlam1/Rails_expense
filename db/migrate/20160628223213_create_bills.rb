class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.datetime :date
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
