class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :address
      t.integer :number
      t.string :complement
      t.string :district
      t.string :string
      t.integer :medium_price

      t.timestamps
    end
  end
end
