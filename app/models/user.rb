class User < ActiveRecord::Base
  has_secure_password

  has_many :messages
  has_many :chat_users
  has_many :chats, through: :chat_users, class_name: Chat
  validates :name, presence: true, uniqueness: true

  after_create :set_session_token

  def self.authorize(params)
    user =
      User.find_by(name:params[:name]).
      try(:authenticate, params[:password])

    return nil unless user

    user.set_session_token
  end

  def set_session_token
    self.tap do |user|
      user.update!(session_token: SecureRandom.hex)
    end
  end
end
