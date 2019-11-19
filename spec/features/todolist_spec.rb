require "capybara/rspec"

feature "homepage" do


  scenario "I should be able to add a todo item" do
    visit '/todolist'
    fill_in('item', :with => 'Buy stamps')
    click_button('submit')
    expect(page).to have_content 'Buy stamps'
  end
end
