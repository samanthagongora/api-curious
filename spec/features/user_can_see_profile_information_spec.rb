require 'rails_helper'


feature "An authenticated user" do
  scenario "can see their profile information" do
    visit root_path
    mock_auth_hash

    click_on 'Sign in with Github'

    expect(page).to have_link('Sign Out')
    expect(page).to have_content("#{User.first.name}")
    expect(page).to have_content('samanthagongora')
  end
end
