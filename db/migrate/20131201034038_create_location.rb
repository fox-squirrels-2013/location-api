class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :address

      t.timestamps
    end
  end
end
