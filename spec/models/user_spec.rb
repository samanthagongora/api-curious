require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: "github",
      uid: "12345678910",
      info: {name: "Samantha Gongora"},
      credentials: {token: "ENV['user_token']"}
    }

    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("12345678910")
    expect(new_user.name).to eq("Samantha Gongora")
  end
end
