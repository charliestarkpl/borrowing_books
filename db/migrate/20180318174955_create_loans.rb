class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.column :status, :integer, default: 0, index: true
      t.date :checkout_date
      t.date :return_date

      t.timestamps
    end
  end
end
