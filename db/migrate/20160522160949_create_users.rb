class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest
      t.string :session_token
      t.string :session_ip
    end
  end
end
