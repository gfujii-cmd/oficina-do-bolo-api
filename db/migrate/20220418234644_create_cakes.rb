class CreateCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :cakes do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :flavor
      t.string :size
      t.float :price
      t.string :custom_image
      t.float :custom_price

      t.timestamps
    end
  end
end
