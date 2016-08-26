require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user = User.create(email: 'luke@test.com', password: 'test_test')
    kfc = Restaurant.create(name: 'KFC', user_id: User.first.id)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

end
