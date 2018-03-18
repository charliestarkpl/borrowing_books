class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :commentable, polymorphic: true, index: true
      t.string :ancestry

      t.timestamps
    end
    add_index :comments, :ancestry
  end
end
