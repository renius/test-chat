require 'rails_helper'

describe Message do
  it { is_expected.to belong_to(:user) }
end
