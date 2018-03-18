class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :full_name, null: false
      t.text :bio

      t.timestamps
    end
  end
end
