require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end

  test "creating a new quote from the index" do
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

  test "showing a quote from the index" do
    visit quotes_path

    # When we click on the name of the quote
    # we expect to be taken to the Quotes#show page
    # which has the title of the quote
    click_link @quote.name
    assert_selector "h1", text: @quote.name
  end

  test "updating a quote from the index" do
    visit quotes_path

    # When we click on the "Edit" link of the quote
    # we expect to be taken to the Quotes#edit page
    # which has the title "Editing Quote"
    click_link "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    # When we fill in the name input with "My Updated Quote"
    # and we click on the "Update Quote" button
    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    # Then we expect to be taken to the Quotes#index page
    # we expect to see the updated quote in the list of quotes
    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
