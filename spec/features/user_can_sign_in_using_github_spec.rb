require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth' do
    stub_omniauth
# binding.pry
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
    "provider"=>"github",
    "uid"=>"1234",
    "info"=>{
      "name"=>"Samantha Gongora"
    }
  })
end
