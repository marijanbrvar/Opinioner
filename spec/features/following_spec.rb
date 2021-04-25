require 'rails_helper'

RSpec.feature 'Followings', type: :feature do
  before :each do
    @user = User.create(full_name: 'User Primo', username: 'Primo')
    @second_user = User.create(full_name: 'User Secondo', username: 'Secondo')
    visit root_path
    page.fill_in 'username', with: 'Primo'
    click_button 'Login!'
  end

  scenario 'Following a user', type: :feature do
    have_link 'User Secondo', href: profile_path(@second_user.id)
    click_link 'Follow'
    have_link 'Profile', href: profile_path(@second_user.id)
    visit profile_path(@user.id)
    expect(page).to have_content('Primo')
    expect(page).to have_text 'User Primo'
    expect(page).to have_text '@Primo'
    have_link 'Follow', href: follow_path(@second_user.id)
    click_link 'Unfollow'
    expect(page).to have_text @user.full_name
  end
end
