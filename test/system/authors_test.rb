require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "creating a Author" do
    visit authors_url
    click_on "New Author"

    fill_in "Email", with: @author.email
    fill_in "Password", with: @author.password
    fill_in "Password confirmation", with: @author.password_confirmation
    fill_in "Username", with: @author.username
    click_on "Save"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "updating a Author" do
    visit authors_url
    click_on "Edit", match: :first

    fill_in "Email", with: @author.email
    fill_in "Password", with: @author.password
    fill_in "Password confirmation", with: @author.password_confirmation
    fill_in "Username", with: @author.username
    click_on "Update"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "destroying a Author" do
    visit authors_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Author was successfully deleted"
  end
end
