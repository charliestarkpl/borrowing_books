class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.boolean :borrowed, default: false
      t.belongs_to :author

      t.timestamps
    end
  end
end
