
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Add new word path', {:type => :feature}) do
  it('Adds a new word to the list') do
    visit('/add_word')
    fill_in('word', :with => "butterfly")
    click_button('Submit')
    expect(page).to have_content('butterfly')
  end
end

describe("View a word and its definitions path", {:type => :feature}) do
  it("picks a word from the list") do
    visit("/")
    click_link("butterfly")
    expect(page).to(have_content('butterfly'))
  end
end

describe("Add another definition path", {:type => :feature}) do
  it("Adds a new definition for the word") do
    visit("/word/1")
    fill_in("definition", :with => "insect with large wings")
    click_button("Submit")
    expect(page).to(have_content('insect with large wings'))
  end
end
