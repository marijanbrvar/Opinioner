require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  scenario 'Log in and log out' do
    user = User.create(full_name: 'User Primo', username: 'Primo')
    second_user = User.create(full_name: 'User Secondo', username: 'Secondo')

    visit root_path
    have_link 'Login!', href: login_path
    have_link 'Sign Up!', href: register_path
    click_link 'Register'
    expect(page.current_path).to eq register_path
    have_link 'Login', href: login_path
    click_link 'Login'
    expect(page.current_path).to eq login_path
    page.fill_in 'username', with: 'Primo'
    click_button 'Login!'
    expect(page.current_path).to eq '/main'
    have_link 'Home', href: main_index_path
    have_link 'Profile', href: profile_path(user.id)
    have_link 'Log out', href: logout_path
    have_link 'User Secondo', href: profile_path(second_user.id)
    click_on 'Logout'
    expect(page.current_path).to eq login_path
  end
end
