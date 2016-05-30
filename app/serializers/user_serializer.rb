class UserSerializer < ActiveModel::Serializer
  attributes :name, :messages_count, :session_token
  # has_one :user
end
