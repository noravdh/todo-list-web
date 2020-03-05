require "capybara/rspec"

feature "homepage" do

  scenario "I should be able to see a list of to do items" do
    visit '/'
    click_link 'To do list'
    expect(page).to have_content "Items in the todo list"
    expect(page).to have_content "Tax returns"
  end

  scenario "I should be able to add a todo item" do
    visit '/add-item'
    fill_in :name, with: 'Buy coffee'
    fill_in :category, with: 'Domestic'
    click_button "submit"
    expect(page).to have_content "Buy coffee"
  end

  scenario "I should be able to see a list of items by category" do
    visit '/bycategory?category=Finance'
    expect(page).to have_content 'Tax returns'
    expect(page).not_to have_content 'Buy milk'
  end

  scenario "I should be able to choose a category to see the list in" do
    visit '/bycategory'
    select('Domestic', :from => 'category')
    click_button 'submit'
    expect(page).not_to have_content 'Tax returns'
    expect(page).to have_content 'Buy milk'
  end

  scenario "I should be able to add an optional deadline to my todo item" do
    visit '/add-item'
    fill_in :name, with: 'Buy coffee'
    fill_in :category, with: 'Domestic'
    fill_in :deadline, with: 'Tomorrow'
    click_button "submit"
    expect(page).to have_content "Tomorrow"
  end

  scenario "I should be able to mark my to do item as complete" do
    # visit '/todolist'
    # check('Buy milk')
    # expect(page).to have_content "Buy milk completed"
  end

end
