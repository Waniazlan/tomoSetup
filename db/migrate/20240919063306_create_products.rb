class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
