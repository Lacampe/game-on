class AddNameToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :name, :string
  end
end
