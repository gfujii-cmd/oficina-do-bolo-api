class AddFkToCake < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cakes, :stores
  end
end
