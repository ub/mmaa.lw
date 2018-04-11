class AddContactToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contact, :text
  end
end
