class AddDescriptionToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :description, :text
  end
end
