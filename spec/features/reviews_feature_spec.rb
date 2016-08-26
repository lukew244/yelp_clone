require 'rails_helper'

feature 'reviewing' do
  before do
    user_sign_up
    user_create_restaurant

  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  def leave_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end

scenario 'displays an average rating for all reviews' do
  leave_review('So so', '3')
  user_sign_out
  second_user_sign_up
  leave_review('Great', '5')
  expect(page).to have_content('Average rating: ★★★★☆')
end

end
