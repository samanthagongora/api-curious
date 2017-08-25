# require 'rails_helper'
#
#
# feature "An authenticated user" do
#   scenario "can see their profile information" do
#     user = User.update_or_create(mock_auth_hash)
#     current_user = user.id
#
#     visit user_path(user)
#
#     expect(page).to have_link('Sign Out')
#     expect(page).to have_content("#{User.first.name}")
#     expect(page).to have_content('samanthagongora')
#   end
# end
