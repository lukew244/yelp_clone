require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user_sign_up
    user_create_restaurant

    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

end
