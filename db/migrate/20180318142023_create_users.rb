class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :name, null: false
      t.string :email, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
