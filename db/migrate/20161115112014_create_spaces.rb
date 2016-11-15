class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.integer :price_per_hour
      t.string :address
      t.string :category
      t.references :user

      t.timestamps
    end
  end
end
