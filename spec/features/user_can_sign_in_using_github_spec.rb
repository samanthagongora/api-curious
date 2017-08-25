require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth and see profile' do
    visit root_path
    mock_auth_hash

    click_link 'Sign in with Github'

    expect(page).to have_link('Sign Out')
    expect(current_path).to eq("/users/#{User.first.id}")
    expect(page).to have_content("#{User.first.name}")
    expect(page).to have_content('samanthagongora')
  end
end
