require 'rails_helper'

describe User do
  it { is_expected.to have_many(:messages) }
  it { is_expected.to have_many(:chats) }
  it { is_expected.to have_many(:chat_users) }
end
