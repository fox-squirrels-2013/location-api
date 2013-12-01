class AddLocationIdToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :location_id, :integer
  end
end
