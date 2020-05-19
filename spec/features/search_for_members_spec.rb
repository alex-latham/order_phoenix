require 'rails_helper'

RSpec.describe "User" do
  it "can search for members of the Order of the Phoenix by character house" do
    visit root_path
    select 'Gryffindor', from: :house
    click_button 'Search For Members'

    expect(current_path).to eq(search_path)
    expect(page).to have_content("Order of the Phoenix: Gryffindor")
    expect(page).to have_content("Total Members: 21")

    within('#members') do
      within('#member-5a0fa7dcae5bc100213c2338') do
        expect(page.all('td')[0]).to have_content("Sirius Black")
        expect(page.all('td')[1]).to have_no_content
        expect(page.all('td')[2]).to have_content("Gryffindor")
        expect(page.all('td')[3]).to have_no_content
      end
      within('#member-5a109f053dc2080021cd8793') do
        expect(page.all('td')[0]).to have_content("Remus Lupin")
        expect(page.all('td')[1]).to have_content("Professor, Defence Against the Dark Arts")
        expect(page.all('td')[2]).to have_content("Gryffindor")
        expect(page.all('td')[3]).to have_content("wolf")
      end
      within('#member-5a1238070f5ae10021650da6') do
        expect(page.all('td')[0]).to have_content("William Weasley")
        expect(page.all('td')[1]).to have_content("Curse Breaker, Gringotts Bank")
        expect(page.all('td')[2]).to have_content("Gryffindor")
        expect(page.all('td')[3]).to have_no_content
      end
    end
  end
end
