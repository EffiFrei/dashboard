require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "visiting the home-page" do
    visit root_path
    assert_selector "h1", text: "EffiFrei Solutions Pvt. Ltd."
  end
end