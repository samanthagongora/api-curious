require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth' do
    visit root_path

    expect(page).to have_link('Login')

    stub_omniauth
    click_link 'Login'

    expect(page).to have_content('Samantha Gongora')
    expect(page).to have_link('Logout')
    expect(page).to have_content
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
