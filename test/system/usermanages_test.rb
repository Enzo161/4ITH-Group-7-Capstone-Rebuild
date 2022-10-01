require "application_system_test_case"

class UsermanagesTest < ApplicationSystemTestCase
  setup do
    @usermanage = usermanages(:one)
  end

  test "visiting the index" do
    visit usermanages_url
    assert_selector "h1", text: "Usermanages"
  end

  test "creating a Usermanage" do
    visit usermanages_url
    click_on "New Usermanage"

    fill_in "Email", with: @usermanage.email
    fill_in "Name", with: @usermanage.name
    click_on "Create Usermanage"

    assert_text "Usermanage was successfully created"
    click_on "Back"
  end

  test "updating a Usermanage" do
    visit usermanages_url
    click_on "Edit", match: :first

    fill_in "Email", with: @usermanage.email
    fill_in "Name", with: @usermanage.name
    click_on "Update Usermanage"

    assert_text "Usermanage was successfully updated"
    click_on "Back"
  end

  test "destroying a Usermanage" do
    visit usermanages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usermanage was successfully destroyed"
  end
end
