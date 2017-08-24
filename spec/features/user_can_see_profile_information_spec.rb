require 'rails_helper'


feature "An authenticated user" do
  scenario "can see their profile information" do

    visit '/'
    click_on 'Sign in with Github'

    expect(page).to have_content(@current_user.name)
  end
end
