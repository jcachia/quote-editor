require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = Quote.ordered.first
  end

  test "showing a quote from the index" do
    visit quotes_path

    # When we click on the name of the quote
    # we expect to be taken to the Quotes#show page
    # which has the title of the quote
    click_link @quote.name
    assert_selector "h1", text: @quote.name
  end

  test "creating a new quote from the index" do
    # When we visit the Quotes#index page
    # we expect to see the heading "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # Then, when we click on the "New Quote" link
    # we expect to be taken to the Quotes#new page
    # which has the title "New Quote"
    click_on "New quote"

    # When we fill in the name input with "My Quote"
    fill_in "Name", with: "My Quote"

    # We expect to remain to the Quotes#index page
    assert_selector "h1", text: "Quotes"
    
    # Then we save the quote
    click_on "Create quote"

    # We still expect to be on the Quotes#index page
    assert_selector "h1", text: "Quotes"

    # and we expect to see the newly created quote in the list of quotes
    assert_text "My Quote"
  end

  test "updating a quote from the index" do
    # When we visit the Quotes#index page
    # we expect to see the heading "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the "Edit" link on the first quote
    # and update the name of the quote
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    # We expect to remain on the Quotes#index page
    assert_selector "h1", text: "Quotes"

    # Then we save the quote
    click_on "Update quote"

    # We still expect to be on the Quotes#index page
    assert_selector "h1", text: "Quotes"

    # we expect to see the updated quote in the list of quotes
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
