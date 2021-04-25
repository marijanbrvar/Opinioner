require 'rails_helper'

RSpec.feature 'Create opinions', type: :feature do
  before :each do
    user = User.create(full_name: 'User Name', username: 'username')
    opinion = user.opinions.build(text: 'Test opinion')
    opinion.save
    visit root_path
    page.fill_in 'username', with: 'username'
    click_button 'Login!'
  end

  scenario 'Opinion create', type: :feature do
    expect(page.current_path).to eq '/main'
    page.fill_in 'opinion[text]', with: 'Test opinion'
    click_button 'Save'
    expect(page).to have_text 'Test opinion'
    expect(page).to have_text 'less than a minute'
  end
end
