class AddUserIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, null: false
  end
end
