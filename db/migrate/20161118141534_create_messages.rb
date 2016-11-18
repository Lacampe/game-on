class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :recipient, foreign_key: {to_table: :users}
      t.references :sender, foreign_key: {to_table: :users}
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
