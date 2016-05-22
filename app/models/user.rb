class User < ActiveRecord::Base
  has_many :messages
  has_many :chat_users
  has_many :chats, through: :chat_users, class_name: Chat
end
