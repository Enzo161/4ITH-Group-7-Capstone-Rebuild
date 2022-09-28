require "application_system_test_case"

class DeepWellsTest < ApplicationSystemTestCase
  setup do
    @deep_well = deep_wells(:one)
  end

  test "visiting the index" do
    visit deep_wells_url
    assert_selector "h1", text: "Deep Wells"
  end

  test "creating a Deep well" do
    visit deep_wells_url
    click_on "New Deep Well"

    fill_in "Client", with: @deep_well.client_id
    fill_in "Name", with: @deep_well.name
    click_on "Create Deep well"

    assert_text "Deep well was successfully created"
    click_on "Back"
  end

  test "updating a Deep well" do
    visit deep_wells_url
    click_on "Edit", match: :first

    fill_in "Client", with: @deep_well.client_id
    fill_in "Name", with: @deep_well.name
    click_on "Update Deep well"

    assert_text "Deep well was successfully updated"
    click_on "Back"
  end

  test "destroying a Deep well" do
    visit deep_wells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deep well was successfully destroyed"
  end
end
