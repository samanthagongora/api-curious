require 'rails_helper'

feature "after user logsin" do
  scenario "they can see their github profile" do
    visit '/'

    stub_omniauth
    click_link 'Login'

    click_on "Locate Members of the House"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("7 Results")
    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end

def stub_omniauth
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider"=>"github",
    "uid"=>123456,
    "info"=>{"name"=>"Samantha Gongora"},
    "credentials"=>{"token"=>"abcdefg12345",
                    "expires"=>false
                  }
  })
end
