class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user, counter_cache: :messages_count
end
