require "rails_helper"

describe "users management" do
  let(:json) { { format: :json } }

  describe 'register user' do
    it "registers new user" do
      expect do
        post "/users", {
          user: { name: 'petrov', password: :password },
          format: :json
        }
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)

      body = JSON.parse(response.body)
      expect(body.keys).to match_array(%w(name messages_count session_token))
    end
  end

  context 'when user already exist' do
    let(:user) { create(:user) }

    it 'declines registration' do
      post "/users",{
        user: { name: user.name, password: :password },
        format: :json
      }
      body = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(body['errors']['name']).to eq(['has already been taken'])
    end
  end
end
