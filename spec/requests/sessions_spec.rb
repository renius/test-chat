require "rails_helper"

describe "session management" do
  let(:json) { { format: :json } }
  let!(:user) { create(:user) }

  it "authenticate session" do
    post "/sessions",{
      user: { name: user.name, password: :password },
      format: :json
    }
    body = JSON.parse(response.body)
    expect(body.keys).to match_array(%w(name messages_count session_token))
    expect(response).to have_http_status(:created)
  end

  it 'rejects authentication' do
    post "/sessions",{
      user: { name: user.name, password: :wrong },
      format: :json
    }
    expect(response.body).to include('name or password invalid')
    expect(response).to have_http_status(401)
  end
end
