class AddCakesToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :cakes, :store
  end
end
