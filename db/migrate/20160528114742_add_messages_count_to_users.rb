class AddMessagesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :messages_count, :integer, default: 0, null: false
  end
end
