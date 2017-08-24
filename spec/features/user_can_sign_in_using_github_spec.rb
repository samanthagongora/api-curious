require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth' do
    visit root_path

    click_link 'Sign in with Github'

    expect(page).to have_link('Sign Out')
    expect(current_path).to eq("/users/#{User.first.id}")
  end
end
