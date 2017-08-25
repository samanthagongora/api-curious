require "rails_helper"

RSpec.feature 'GithubService' do
  describe "data" do
    it "finds all user data" do
      visit root_path
      mock_auth_hash

      click_link 'Sign in with Github'
      # VCR.use_cassette("service/find_co_members") do
        data = GithubService.get_user_data(user)

        expect(data[:name]).to eq('Samantha Gongora')
        expect(data[:email]).to eq('samantha.gongora@gmail.com')
      # end
    end
  end
end
