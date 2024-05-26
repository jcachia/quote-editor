require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  # ## Visiting the Quotes#index page
  # ## we expect to see the heading "Quotes"
  #   visit quotes_url
  
  #   assert_selector "h1", text: "Quotes"
  # end

  test "creating a new quote" do
    # When we visit the Quotes#index page
    # we expect to see the heading "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # Then, when we click on the "New Quote" link
    # we expect to be taken to the Quotes#new page
    # which has the title "New Quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # When we fill in the name input with "My Quote"
    # and we click on the "Create Quote" button
    fill_in "Name", with: "My Quote"
    click_on "Create Quote"

    # Then we expect to be taken to the Quotes#index page
    # we expect to see the newly created quote in the list of quotes
    assert_selector "h1", text: "Quotes"
    assert_text "My Quote"
  end

end
