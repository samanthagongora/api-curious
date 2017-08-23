require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth' do
    stub_omniauth

    visit root_path

    expect(page).to have_link('Login')
    click_link 'Login'

    expect(page).to have_content('Samantha Gongora')
    expect(page).to have_link('Logout')
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "code"=>"430c3d0bd82c664b9652",
    "controller"=>"sessions",
    "action"=>"create"
    })
end
