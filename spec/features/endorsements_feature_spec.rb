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

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

  scenario 'reviews display the correct number of endorsements', js: true do
  visit '/restaurants'
  5.times do
    click_link 'Endorse Review'
    wait_for_ajax
  end
  expect(page).to have_content('5 endorsements')
end

end
