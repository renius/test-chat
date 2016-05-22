class CreateChatUsers < ActiveRecord::Migration
  def change
    create_table :chat_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
