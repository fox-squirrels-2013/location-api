class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t| 
      t.integer :price
      t.integer :percentage
      t.string :item

      t.timestamps
    end
  end  
end
